export type ProcessStep = {
  stepNumber: number;
  title: string;
  description?: string;
  estimatedTime?: string;
};

export type DocumentRequirement = {
  name: string;
  description?: string;
  isRequired?: boolean;
};

export type OfficeInfo = {
  issuingAgency: string;
  locations?: string[];
  feeAmount?: number;
  feeCurrency?: string;
  oneTimeFee?: boolean;
};

export type GuideStatus = "pending" | "accepted" | "rejected" | "to_revise";

export type GuideCategory =
  | "identification"
  | "civil-registration"
  | "permits-licenses"
  | "social-services"
  | "tax-related"
  | "legal"
  | "other";
