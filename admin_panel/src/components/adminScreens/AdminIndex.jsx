import React from 'react'
import AdminNaviRoute from './AdminNaviRoute'
import FooterContent from './FooterContent'
import { ToggleStateProvider } from './ToggleState';

export default function AdminIndex() {
  return (
    <div>
      <ToggleStateProvider>
        <AdminNaviRoute />

        <FooterContent />
      </ToggleStateProvider>




     </div> 
  );
}
