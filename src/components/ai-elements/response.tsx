import React from "react";

export function Response({ children }: { children: React.ReactNode }) {
  return (
    <div className="prose prose-neutral dark:prose-invert">
      {children}
    </div>
  );
}
