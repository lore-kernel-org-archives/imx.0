Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012071.outbound.protection.outlook.com [52.101.66.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CDD4A2E00
	for <imx@lists.linux.dev>; Tue, 21 Jul 2026 10:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784630024; cv=fail; b=Ci7baBsxlvoPlpQFmfHhjumrA0hGKYkUli8C5/6qSZSXD940wdQ/EKjKTWbZSPMlRb8gDoKf0vROdrj2tVU+ANf6FWHG+JbRuYDYLq2oY1ljqBk/d1InVJEBKCsp/machoREJKMoCOc6xQQPsC3a+dMsLS6hYnmAgws6VxEyU9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784630024; c=relaxed/simple;
	bh=KwERx2f378GrGTbNQNaDHOOC0BXofPbtYLzT09Cw6q8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UGJ3XwVjo+wKjwnYePt2F5/jHOkxKVZ8/waJiHooacka8tr8J7TmrK2/2JL3JmybA3+cviZjTDrFDUH5vK+QRBIj7vQ6HdNhGFrdLlYbaQc3UL0m/IT3zsPCKry7mTzWRGTt6LgD2+jeKnJ5TKrPuHqx4RN1WWmz59mW3jqYTBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=p6b4UNdZ; arc=fail smtp.client-ip=52.101.66.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="p6b4UNdZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+pjQbzU6RRXw+iVozWeJdl9EcytprCDfr6IkPNF4x6ghi7a8l5Qr3tY8ng9w+W0W3aJVjpCceBj4409oJ2KtCKWEovr2jdc4zPKlhx7OaU8BEth7w7FLP63hmVD6M09m/k+81sSN6cX1c5hbe+UZnHLhVmfklv21JNvECSA8k2pXisFdqZTox8byCr7G1jHtMguyalwK6Edk5eRN7Mp3gZP6X/dIpbgTitjV/AsW+n2T/dkwvMIbOYtGZ5btAYIVuKfYzaGimyQHycbK30p5l/pJoRWQpZN4XCL44W59+sBZhiFUiXdj1oyzcABY2SSGi6NW8OtmySatf+LdvLAiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2pgzQAJ5nBE8yvXqwbYi2U1lwNOBKrpiCncKIRqCRbs=;
 b=wZonPumFc/tEzWeJ9/9bbTRIx1eqczpl7WjKS8LNbbaxeeV7hNnjF2vBU2/+/xQ0Lg+Ud5uwEIXu3h2QA1j+fbJCGgH1+ajUC3+aXqTSZ+08unYHL1hqrfl/voVW2PcGOIAaE/hMPBgwDpq1o44KRFx/OZH3TvLvApos4QdgV8To0i/4kRj53xAiPYWAJ9n8ljrb98pW85THDz1BYgfsCM/bRwKkoenbvkl/1IyajKayfkSFqpbVh9Blola+EhZmMXmZ9lF1KTU8DJIhDU6/Ghjz/M1LokZrimACaWQqrx14OvJDmps5ZB4OzYHeeM3kYqCQR/07ZYCTlnkv2YyZMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2pgzQAJ5nBE8yvXqwbYi2U1lwNOBKrpiCncKIRqCRbs=;
 b=p6b4UNdZyzGr+eAZsXTcbqSPYeZSRT2LzVkrTtSjgK5LICoWLERU2g072Aj1nnopvXbXJU++Vw6vCDdVbsf2tuEtKbL1LqclLWmS9LV9tNp4KEpNPkqS/HH3tEMPIRuewZjFUdEigN6HntiBC6Nyexfz8V0swUjruXCveDR6DVBLk4no9VhkRQ4jxEzGonHj8D9vLPhg1FEVZrHdLN8rutxFCs4dGFmMPpdgr9Eph1P4c7GlYBR8MLEswLePvdbhB/uXEgnTRAFpQqQ5T7HyV+hMQ1hk3bthWYKric7qwWBcYchFdXFOy9vVnmZkMDIfqPjlXdk/KhggPzdQ35Zxfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by VE1PR04MB7231.eurprd04.prod.outlook.com (2603:10a6:800:1a9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 10:33:31 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 10:33:31 +0000
From: pankaj.gupta@oss.nxp.com
Date: Tue, 21 Jul 2026 16:53:34 +0530
Subject: [PATCH v29 3/7] firmware: imx: add driver for NXP EdgeLock Enclave
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-imx-se-if-v29-3-04a362f4fcca@nxp.com>
References: <20260721-imx-se-if-v29-0-04a362f4fcca@nxp.com>
In-Reply-To: <20260721-imx-se-if-v29-0-04a362f4fcca@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 sashiko-bot <sashiko-bot@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784633013; l=47458;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=zNcRsalJyhehMwH7SvfiTjn5HiZtXw60xuRg2nj94ME=;
 b=KIoQVDT7AJHLpHovNYefOi5rZ14qNhjdai+zoItF82glGTU4yWcTvdqTRm6Ij9qSd2bw5Fsmj
 C2X5ZBIbS9DD+Uo1h5x8W40RBdil+a6jqq/Ynl2MyVF30v+QnygJnaY
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: MEWP282CA0154.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:1d7::19) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|VE1PR04MB7231:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b0d41fd-a10b-44d1-5654-08dee7138299
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|19092799006|23010399003|366016|921020|6133799003|18002099003|22082099003|3023799007|56012099006|5023799004|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	evQWFrebfJX5yNWjI/XbJXwVidvEm55Okj+uQIBaZe8F5NrEVXUcAUq+6YyBOPOqfN8MSCh9LKw/KkgSbBgmKwoExihVqI23gHc6CALFEfvc8QSrux7dqk2r9I/USjPH8jo+PgWCRLlkxurTg8q4Y/TDafD5X3O+Sk82HAfv/rb9X+hw8LDqT399sxOf5NJ+YJ2lRQ1ZlZSO41qjWs7r1YbfcYfOIHnZ6QEaJPBkSTotUrKzJtCnu+B34tcT4Vs+wyecRD3IEoGHKlNk7XlC28uIX4fmiS8Qa5g2cYKlvAO+bLwXpKuxxiCd2fi6k4MXxu04h/9LVL8QDrxX+q5vE8IQjARYR8eA+ssFjiRyPVEKNlXUN6Km1cSBP/1gmsCLoC8jLPUleuxJ7l2ynM++jd7wsoWj95JJ0YRBNTofcaWl9trJ+7j1z91Rvxk3GXy6GU2ioZwPmvO3rp8zaD1QKm3q9u5DbK8xkbKBmfrxGpOaXhJMAWtJm/bhANq33C3N/+MQHdJnxOkZCHk+SVfRTfK0BAaWuAWHmZZZsDnZ/eL8Jy58oPD1H3OX1NFPacbGEBFq7MeRhRa/iZBO+3fIz7id1zB/GkAn0TP0lj0SUVaaqaKwTdcoJz6rnP/fhORZtx8L0XGC2U5GLQumjhANTA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(19092799006)(23010399003)(366016)(921020)(6133799003)(18002099003)(22082099003)(3023799007)(56012099006)(5023799004)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NG9rOGhkWGJKN2FkQ0ErWENRc2tNemViSnlRVEF1Y3AzK3owYngvV3p1dVRz?=
 =?utf-8?B?aldiRWpaanVvekF4ZGpEckF3b1dGSitldWwxZ0k5UDhUKzNDSGdQbGg4aVFB?=
 =?utf-8?B?Q214eWJoRWcvdEtmQ0djeXQrZTR0QUZNaSt5ZTdwK2NHcHBGQjZGbGtlNlAw?=
 =?utf-8?B?UzNaTHZGb3BEcnBkdGhCTWhjNFZRaElqUXZkbnJKdTBZOXI0R3dRbFVqeXgv?=
 =?utf-8?B?RllGRGJmaVFicytSTG9EeHliVW5XTWhPZ2NoT250RDlzMi9oMXRwL2xPZGd6?=
 =?utf-8?B?UitmZmdaRXlETTRzS2RvTHFnUjVJZVBJREEwZkR1R2hQN0MyOSt1eXZPUlg2?=
 =?utf-8?B?dXZqUTVEU21FMVV0RGtIMENsOFRua0V1NmR1UGxYaytsblFlSWljczRMMTVG?=
 =?utf-8?B?R1VIOXBqUkhJcUMzNEk1K0FibER1emdRYUFQSkVWbEJuZjh5WTJld2dUU1J0?=
 =?utf-8?B?dGdYMEtTWVg0NjNKMGs3cHlWYWdEQXRMbWswUldmUmc4bXlzdGFmakNQdWpx?=
 =?utf-8?B?aUZrMFVPbXJIYndCYXJxVjhua05VQUJOQmJLMUN5MXkzZXhlNHdRTjd1K3JU?=
 =?utf-8?B?MVMybkV0ZEhzN2NweUhOeHE5OFZ0NEJHVUZERkFuUUZWSlFRTTNOMEZMN1pN?=
 =?utf-8?B?NzBkQXdLOHpaYVVuUXlTTENNM2dqanRwZDJiUVZxTXR0OTRMS083Tk8vMG1J?=
 =?utf-8?B?N2ErSTl5WGxrbWdpd3NhdmNTVVMzV0c2ak8vVDJTMk1GK3BMbE9Lbk9GQTVT?=
 =?utf-8?B?cnRsdkJFcTJCRUg4cy93NExDVGIrZEFkQnB0VytZUEFhYjByMjNIWG9VdXdJ?=
 =?utf-8?B?K0NyREIydFpnSi9yQkNHMUxQUlVONkRHYTIyc0haYmtqdTN4NUJlRzZkVnli?=
 =?utf-8?B?dmVLVzhGL3BxcWJTN3ljUU1xb05OdExCWGd3dXJyOGhvSm16UmN3cGljREN4?=
 =?utf-8?B?SzZzRk1nOHJDV0tXdFdld29CQTYzVHFyMHlpWVFKdlZOOXJ2dFhvVXFrOWFr?=
 =?utf-8?B?bVM4aUY3NkV0OVUrdkRRVy83SEpiUzg0MXNRMmtlamtSRE5HTUJMVzJKaHdV?=
 =?utf-8?B?STRpQnNibnFwc3ZHK0NDd00vV05iUEZZNTBXK0c1S01EQjc5Q0krcGx6QWZU?=
 =?utf-8?B?Y280bHE2eHNjaWxPZjcwdWp2U2ZTSlNqYjQvL1ZwMzRKU3J0LzMzVlpPRGMv?=
 =?utf-8?B?MDkvc2JZcmxySmxRZk1KYVpSZEdrYTNlR0RScHgyRGZZMmowTjBYYklQclpZ?=
 =?utf-8?B?bnZzK056NlMrL0FjRkNlUm1BZC9zMFArM3hsN1ZVWWJ1dGVrZ2pVSHUySzYr?=
 =?utf-8?B?b1YvcTh6eG01ZWphaTdsOHdUYm9HYlBteWVXMm42bys3VXFJY3pzQ29ScXhF?=
 =?utf-8?B?aTBBc2JKRjhscGl0N1A1MzFJeDk2eXVpajJSdmorYmVlY2lzNWRFd01mNUJi?=
 =?utf-8?B?b215V2pKSmpFcVN4TnlLVmExb25MekdXVlZ2YTJRR2RWTGZqbld5ZUNwWitY?=
 =?utf-8?B?YjVvWTgzUGkwdnVtOTJkM0EvZW1NVjFuV3YyU1N5WUhmN3RtOStYWFNKUnBw?=
 =?utf-8?B?Z3g4VlBrc0FjSkJqaUZJZnMrOGVYbWhnZjdIOU1JaDJheGJpR2I3OWpVNnJB?=
 =?utf-8?B?RXFoOUFtSVpieG1TakRhUy9kNE1RSlhtUFRDczZMbWFZSTN4TllnTkVUWWVx?=
 =?utf-8?B?TzNBTWJnaWFBWit4ZU1UWFRiR1YxNHF3dE1HckpTSlNTMUlJVWdDQ09pK0Zs?=
 =?utf-8?B?UnJ6TUFVWVFNdEUxRzNrNzAyRmU2REF4VzhxVE53YWxqUjlCUGg1Mjk3QnBV?=
 =?utf-8?B?TkY1aHgxSXcvNlZoRHhJeENnUGF0dkdkMEJGekk1K01pNkltazVqN0NQNFNE?=
 =?utf-8?B?cjFaeFBoNlpyMzltTHhxMC9lNXRDM2NDaVZLMmVUY0x0TC8zWGUxRDluWllR?=
 =?utf-8?B?TkY1bWtMZGV2K1VVdGtFOXcvcWY1WjY2bCtDYnlZVEtXZjBGbjJ6Q0JkMVdP?=
 =?utf-8?B?UnIyZmZVMnkzbzRSeEFsTTFkTlBPcTJsYVBGMUhRRUhVc0dJdlZPdVlaUzJU?=
 =?utf-8?B?cTVWVFNBUHY3VVZFbHpvMnFRcVlpZ2VzbEdFUzFyaGRZbVJDZXhHTFU3Mzdh?=
 =?utf-8?B?WjBPUEhsNTV5SzY5M2RJei8wZFE1Zng0bGhZOWkwenBCRzVKdmhjWVhwQWNL?=
 =?utf-8?B?RndYTCtQcWVzZXJsbGRBOEhWaTNkUWNqbmJQek14UCtEVjAxM2s2d3lmWDRU?=
 =?utf-8?B?a25BUXBuWUp4VTgrM0lqSGVpUFl2ZXFkWU8rbHpROUJ1VnBkaXZNSFB0Wk11?=
 =?utf-8?B?eHkwcHpUd3ZVQ2NzYjB6SXBkeW9hQndidDRTOGF2TGc2ZjF6bUFwV3IreWNU?=
 =?utf-8?Q?2fG26LT5Oc6ntBmHP+gjH2XbRR7zrD9CjRdyT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b0d41fd-a10b-44d1-5654-08dee7138299
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 10:33:31.8568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tDlhULdAGOeJ4AUIiitjXwmwMhC2RttvhCQWe2h9VrD4OfehYo0+UT4UwNfg1fHcU60ioMWqhQ5LTgjkRx3RwdQjNvqGODYsi3YLS6qezvlEkiUUiefdE1BHgYCctIFm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7231

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Add MU-based communication interface for secure enclave.

NXP hardware IP(s) for secure-enclaves like Edgelock Enclave(ELE), are
embedded in the SoC to support the features like HSM, SHE & V2X, using
message based communication interface.

The secure enclave FW communicates with Linux over single or multiple
dedicated messaging unit(MU) based interface(s).
Exists on i.MX SoC(s) like i.MX8ULP, i.MX93, i.MX95 etc.

For i.MX9x SoC(s) there is at least one dedicated ELE MU(s) for each
world - Linux(one or more) and OPTEE-OS (one or more).

Other dependent kernel drivers will be:
- NVMEM: that supports non-volatile devices like EFUSES,
  managed by NXP's secure-enclave.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
Changes from v28 to v29:
Fixes Sashiko AI issue:

- Remove file descriptor, shared-memory setup, and userspace send/receive
  working from the initial Kconfig help text, because the misc-device UAPIs
  added later in the series.

- Replace unaligned u32 pointer access in GET_SERIAL_NUM_FROM_UID() with
  get_unaligned_le32(), avoiding undefined behavior when parsing UID data
  from byte-aligned buffers.

- Add SE_RCV_MSG_DEFAULT_TIMEOUT_MS and set the default response timeout to
  3000 ms.

- Replace MAX_SCHEDULE_TIMEOUT in ele_msg_rcv() with a bounded default response
  timeout using SE_RCV_MS_DEFAULT_TIMEOUT_MS.

- Start handling mailbox messages with IS_ERR_OR_NULL() in se_if_rx_callback()
  before dereferencing msg.

- Fix SoC revision string formatting to print major.minor instead of
  mijor.major.

Fixes for issues reported by Sashiko AI bot on 5/7:
- Move se_if_probe_cleanup devres registration right after mailbox channel
  requests.

- Split the changes into two so that:
  - Initialize load_fw_lock and firmware-load state before the misc device can be
  registered or exposed to userspace in 5/7. Setting load_fw->se_fw_img_nm and
  load_fw->is_fw_tobe_loaded before possible userspace access to the misc device.

  - Keep IMEM management independent from runtime firmware loading metadata.
  Add imem_state_mgmt to struct se_soc_info to separate IMEM save/restore
  buffer management from firmware image availability. Enable IMEM state
  management explicitly for i.MX8ULP by setting imem_state_mgmt = true.
  Allocate encrypted IMEM buffer based on imem_state_mgmt instead of tying it
  to prim_fw_nm_in_rfs.

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260717-imx-se-if-v28-0-0a9659c7e69d@nxp.com?part=3
Closes: https://sashiko.dev/#/patchset/20260717-imx-se-if-v28-0-0a9659c7e69d@nxp.com?part=5
---
 drivers/firmware/imx/Kconfig        |  12 +
 drivers/firmware/imx/Makefile       |   2 +
 drivers/firmware/imx/ele_base_msg.c | 277 +++++++++++++++++++++
 drivers/firmware/imx/ele_base_msg.h | 100 ++++++++
 drivers/firmware/imx/ele_common.c   | 469 ++++++++++++++++++++++++++++++++++++
 drivers/firmware/imx/ele_common.h   |  45 ++++
 drivers/firmware/imx/se_ctrl.c      | 459 +++++++++++++++++++++++++++++++++++
 drivers/firmware/imx/se_ctrl.h      | 111 +++++++++
 include/linux/firmware/imx/se_api.h |  14 ++
 9 files changed, 1489 insertions(+)

diff --git a/drivers/firmware/imx/Kconfig b/drivers/firmware/imx/Kconfig
index 127ad752acf8..93ac339800e2 100644
--- a/drivers/firmware/imx/Kconfig
+++ b/drivers/firmware/imx/Kconfig
@@ -55,3 +55,15 @@ config IMX_SCMI_MISC_DRV
 	  core that could provide misc functions such as board control.
 
 	  This driver can also be built as a module.
+
+config IMX_SEC_ENCLAVE
+	tristate "i.MX Embedded Secure Enclave - EdgeLock Enclave Firmware driver."
+	depends on MAILBOX && ((IMX_MBOX && ARCH_MXC && ARM64) || COMPILE_TEST)
+	select FW_LOADER
+	default m if ARCH_MXC
+
+	help
+	  Exposes APIs supported by the iMX Secure Enclave HW IP called:
+	  - EdgeLock Enclave Firmware (for i.MX8ULP, i.MX93),
+	    like base, HSM, V2X & SHE using the SAB protocol via the shared Messaging
+	    Unit.
diff --git a/drivers/firmware/imx/Makefile b/drivers/firmware/imx/Makefile
index 3bbaffa6e347..4412b15846b1 100644
--- a/drivers/firmware/imx/Makefile
+++ b/drivers/firmware/imx/Makefile
@@ -4,3 +4,5 @@ obj-$(CONFIG_IMX_SCU)		+= imx-scu.o misc.o imx-scu-irq.o rm.o imx-scu-soc.o
 obj-${CONFIG_IMX_SCMI_CPU_DRV}	+= sm-cpu.o
 obj-${CONFIG_IMX_SCMI_MISC_DRV}	+= sm-misc.o
 obj-${CONFIG_IMX_SCMI_LMM_DRV}	+= sm-lmm.o
+sec_enclave-objs		= se_ctrl.o ele_common.o ele_base_msg.o
+obj-${CONFIG_IMX_SEC_ENCLAVE}	+= sec_enclave.o
diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
new file mode 100644
index 000000000000..a2ede9c01691
--- /dev/null
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -0,0 +1,277 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <linux/types.h>
+
+#include <linux/cleanup.h>
+#include <linux/completion.h>
+#include <linux/dma-mapping.h>
+#include <linux/genalloc.h>
+
+#include "ele_base_msg.h"
+#include "ele_common.h"
+
+#define FW_DBG_DUMP_FIXED_STR		"ELE"
+
+static void ele_get_info_cleanup(struct se_if_priv *priv, u32 *buf, dma_addr_t d_addr,
+				 size_t size)
+{
+	if (priv->mem_pool)
+		gen_pool_free(priv->mem_pool, (unsigned long)buf, size);
+	else
+		dma_free_coherent(priv->dev, size, buf, d_addr);
+}
+
+int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
+{
+	dma_addr_t get_info_addr = 0;
+	u32 *get_info_data = NULL;
+	int ret = 0;
+
+	if (!priv)
+		return -EINVAL;
+
+	memset(s_info, 0x0, sizeof(*s_info));
+
+	struct se_api_msg *tx_msg __free(kfree) =
+		kzalloc(ELE_GET_INFO_REQ_MSG_SZ, GFP_KERNEL);
+	if (!tx_msg)
+		return -ENOMEM;
+
+	struct se_api_msg *rx_msg __free(kfree) =
+		kzalloc(ELE_GET_INFO_RSP_MSG_SZ, GFP_KERNEL);
+	if (!rx_msg)
+		return -ENOMEM;
+
+	if (priv->mem_pool)
+		get_info_data = gen_pool_dma_alloc(priv->mem_pool,
+						   ELE_GET_INFO_BUFF_SZ,
+						   &get_info_addr);
+	else
+		get_info_data = dma_alloc_coherent(priv->dev,
+						   ELE_GET_INFO_BUFF_SZ,
+						   &get_info_addr,
+						   GFP_KERNEL);
+	if (!get_info_data) {
+		dev_err(priv->dev,
+			"%s: Failed to allocate get_info_addr.", __func__);
+		return -ENOMEM;
+	}
+
+	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
+			    ELE_GET_INFO_REQ, ELE_GET_INFO_REQ_MSG_SZ, true);
+
+	tx_msg->data[0] = upper_32_bits(get_info_addr);
+	tx_msg->data[1] = lower_32_bits(get_info_addr);
+	tx_msg->data[2] = sizeof(*s_info);
+	ret = ele_msg_send_rcv(priv, tx_msg, ELE_GET_INFO_REQ_MSG_SZ, rx_msg,
+			       ELE_GET_INFO_RSP_MSG_SZ);
+	if (ret < 0) {
+		ele_get_info_cleanup(priv, get_info_data, get_info_addr, ELE_GET_INFO_BUFF_SZ);
+		return ret;
+	}
+
+	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_GET_INFO_REQ,
+				      ELE_GET_INFO_RSP_MSG_SZ, true);
+	if (ret < 0) {
+		ele_get_info_cleanup(priv, get_info_data, get_info_addr, ELE_GET_INFO_BUFF_SZ);
+		return ret;
+	}
+
+	memcpy(s_info, get_info_data, sizeof(*s_info));
+
+	ele_get_info_cleanup(priv, get_info_data, get_info_addr, ELE_GET_INFO_BUFF_SZ);
+
+	return ret;
+}
+
+int ele_fetch_soc_info(struct se_if_priv *priv, void *data)
+{
+	return ele_get_info(priv, (struct ele_dev_info *)data);
+}
+
+int ele_ping(struct se_if_priv *priv)
+{
+	int ret = 0;
+
+	if (!priv)
+		return -EINVAL;
+
+	struct se_api_msg *tx_msg __free(kfree) = kzalloc(ELE_PING_REQ_SZ,
+							  GFP_KERNEL);
+	if (!tx_msg)
+		return -ENOMEM;
+
+	struct se_api_msg *rx_msg __free(kfree) = kzalloc(ELE_PING_RSP_SZ,
+							  GFP_KERNEL);
+	if (!rx_msg)
+		return -ENOMEM;
+
+	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
+			    ELE_PING_REQ, ELE_PING_REQ_SZ, true);
+
+	ret = ele_msg_send_rcv(priv, tx_msg, ELE_PING_REQ_SZ, rx_msg,
+			       ELE_PING_RSP_SZ);
+	if (ret < 0)
+		return ret;
+
+	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_PING_REQ,
+				      ELE_PING_RSP_SZ, true);
+
+	return ret;
+}
+
+int ele_service_swap(struct se_if_priv *priv,
+		     dma_addr_t addr,
+		     u32 addr_size, u16 flag)
+{
+	int ret = 0;
+
+	if (!priv)
+		return -EINVAL;
+
+	if (upper_32_bits(addr)) {
+		dev_err(priv->dev,
+			"ELE service-swap address exceeds 32-bit range: %pad\n",
+			&addr);
+		return -ERANGE;
+	}
+
+	struct se_api_msg *tx_msg __free(kfree)	=
+		kzalloc(ELE_SERVICE_SWAP_REQ_MSG_SZ, GFP_KERNEL);
+	if (!tx_msg)
+		return -ENOMEM;
+
+	struct se_api_msg *rx_msg __free(kfree) =
+		kzalloc(ELE_SERVICE_SWAP_RSP_MSG_SZ, GFP_KERNEL);
+	if (!rx_msg)
+		return -ENOMEM;
+
+	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
+			    ELE_SERVICE_SWAP_REQ, ELE_SERVICE_SWAP_REQ_MSG_SZ, true);
+
+	tx_msg->data[0] = flag;
+	tx_msg->data[1] = addr_size;
+	tx_msg->data[2] = ELE_NONE_VAL;
+	tx_msg->data[3] = lower_32_bits(addr);
+	ret = se_update_msg_chksum((u32 *)&tx_msg[0], ELE_SERVICE_SWAP_REQ_MSG_SZ);
+	if (ret)
+		return -EINVAL;
+
+	ret = ele_msg_send_rcv(priv, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
+			       rx_msg, ELE_SERVICE_SWAP_RSP_MSG_SZ);
+	if (ret < 0)
+		return ret;
+
+	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_SERVICE_SWAP_REQ,
+				      ELE_SERVICE_SWAP_RSP_MSG_SZ, true);
+	if (ret)
+		return ret;
+
+	if (flag == ELE_IMEM_EXPORT)
+		ret = rx_msg->data[1];
+	else
+		ret = 0;
+
+	return ret;
+}
+
+int ele_fw_authenticate(struct se_if_priv *priv, dma_addr_t contnr_addr,
+			dma_addr_t img_addr)
+{
+	int ret = 0;
+
+	if (!priv)
+		return -EINVAL;
+
+	if (upper_32_bits(contnr_addr) || upper_32_bits(img_addr)) {
+		dev_err(priv->dev, "Wrong address: %pap %pap\n", &contnr_addr, &img_addr);
+		return -EINVAL;
+	}
+
+	struct se_api_msg *tx_msg __free(kfree)	=
+		kzalloc(ELE_FW_AUTH_REQ_SZ, GFP_KERNEL);
+	if (!tx_msg)
+		return -ENOMEM;
+
+	struct se_api_msg *rx_msg __free(kfree) =
+		kzalloc(ELE_FW_AUTH_RSP_MSG_SZ, GFP_KERNEL);
+	if (!rx_msg)
+		return -ENOMEM;
+
+	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
+			    ELE_FW_AUTH_REQ, ELE_FW_AUTH_REQ_SZ, true);
+
+	tx_msg->data[0] = lower_32_bits(contnr_addr);
+	tx_msg->data[1] = 0;
+	tx_msg->data[2] = lower_32_bits(img_addr);
+
+	ret = ele_msg_send_rcv(priv, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
+			       ELE_FW_AUTH_RSP_MSG_SZ);
+	if (ret < 0)
+		return ret;
+
+	ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_FW_AUTH_REQ,
+				      ELE_FW_AUTH_RSP_MSG_SZ, true);
+
+	return ret;
+}
+
+int ele_debug_dump(struct se_if_priv *priv)
+{
+	bool keep_logging;
+	int msg_ex_cnt;
+	int ret = 0;
+	int i;
+
+	if (!priv)
+		return -EINVAL;
+
+	struct se_api_msg *tx_msg __free(kfree) = kzalloc(ELE_DEBUG_DUMP_REQ_SZ,
+							  GFP_KERNEL);
+	if (!tx_msg)
+		return -ENOMEM;
+
+	struct se_api_msg *rx_msg __free(kfree)	= kzalloc(ELE_DEBUG_DUMP_RSP_SZ,
+							  GFP_KERNEL);
+	if (!rx_msg)
+		return -ENOMEM;
+
+	se_fill_cmd_msg_hdr(priv, &tx_msg->header, ELE_DEBUG_DUMP_REQ,
+			    ELE_DEBUG_DUMP_REQ_SZ, true);
+
+	msg_ex_cnt = 0;
+	do {
+		memset(rx_msg, 0x0, ELE_DEBUG_DUMP_RSP_SZ);
+
+		ret = ele_msg_send_rcv(priv, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
+				       rx_msg, ELE_DEBUG_DUMP_RSP_SZ);
+		if (ret < 0)
+			return ret;
+
+		ret = se_val_rsp_hdr_n_status(priv, rx_msg, ELE_DEBUG_DUMP_REQ,
+					      ELE_DEBUG_DUMP_RSP_SZ, true);
+		if (ret) {
+			dev_err(priv->dev, "Dump_Debug_Buffer Error: %x.", ret);
+			break;
+		}
+		keep_logging = (rx_msg->header.size >= (ELE_DEBUG_DUMP_RSP_SZ >> 2) &&
+				msg_ex_cnt < ELE_MAX_DBG_DMP_PKT);
+
+		rx_msg->header.size -= 2;
+
+		if (rx_msg->header.size > 2)
+			rx_msg->header.size--;
+
+		for (i = 0; i < rx_msg->header.size; i += 2)
+			dev_info(priv->dev, "%s%02x_%02x: 0x%08x 0x%08x",
+				 FW_DBG_DUMP_FIXED_STR,	msg_ex_cnt, i,
+				 rx_msg->data[i + 1], rx_msg->data[i + 2]);
+
+		msg_ex_cnt++;
+	} while (keep_logging);
+
+	return ret;
+}
diff --git a/drivers/firmware/imx/ele_base_msg.h b/drivers/firmware/imx/ele_base_msg.h
new file mode 100644
index 000000000000..d532c3f49449
--- /dev/null
+++ b/drivers/firmware/imx/ele_base_msg.h
@@ -0,0 +1,100 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2025 NXP
+ *
+ * Header file for the EdgeLock Enclave Base API(s).
+ */
+
+#ifndef ELE_BASE_MSG_H
+#define ELE_BASE_MSG_H
+
+#include <linux/unaligned.h>
+#include <linux/device.h>
+#include <linux/types.h>
+
+#include "se_ctrl.h"
+
+#define ELE_NONE_VAL			0x0
+
+#define ELE_GET_INFO_REQ		0xda
+#define ELE_GET_INFO_REQ_MSG_SZ		0x10
+#define ELE_GET_INFO_RSP_MSG_SZ		0x08
+
+#define MAX_UID_SIZE                     (16)
+#define DEV_GETINFO_ROM_PATCH_SHA_SZ     (32)
+#define DEV_GETINFO_FW_SHA_SZ            (32)
+#define DEV_GETINFO_OEM_SRKH_SZ          (64)
+#define DEV_GETINFO_MIN_VER_MASK	0xff
+#define DEV_GETINFO_MAJ_VER_MASK	0xff00
+#define ELE_DEV_INFO_EXTRA_SZ		0x60
+
+struct dev_info {
+	u8  cmd;
+	u8  ver;
+	u16 length;
+	u16 soc_id;
+	u16 soc_rev;
+	u16 lmda_val;
+	u8  ssm_state;
+	u8  dev_atts_api_ver;
+	u8  uid[MAX_UID_SIZE];
+	u8  sha_rom_patch[DEV_GETINFO_ROM_PATCH_SHA_SZ];
+	u8  sha_fw[DEV_GETINFO_FW_SHA_SZ];
+};
+
+struct dev_addn_info {
+	u8  oem_srkh[DEV_GETINFO_OEM_SRKH_SZ];
+	u8  trng_state;
+	u8  csal_state;
+	u8  imem_state;
+	u8  reserved2;
+};
+
+struct ele_dev_info {
+	struct dev_info d_info;
+	struct dev_addn_info d_addn_info;
+};
+
+#define ELE_GET_INFO_BUFF_SZ		(sizeof(struct ele_dev_info) \
+						+ ELE_DEV_INFO_EXTRA_SZ)
+
+#define GET_SERIAL_NUM_FROM_UID(x, uid_word_sz) ({\
+	const u8 *__x = (const u8 *)(x); \
+	size_t __sz = (uid_word_sz); \
+	((u64)get_unaligned_le32(__x + (__sz - 1) * sizeof(u32)) << 32) | \
+		get_unaligned_le32(__x); \
+	})
+
+#define ELE_MAX_DBG_DMP_PKT		50
+#define ELE_DEBUG_DUMP_REQ		0x21
+#define ELE_DEBUG_DUMP_REQ_SZ		0x4
+#define ELE_DEBUG_DUMP_RSP_SZ		0x5c
+
+#define ELE_PING_REQ			0x01
+#define ELE_PING_REQ_SZ			0x04
+#define ELE_PING_RSP_SZ			0x08
+
+#define ELE_SERVICE_SWAP_REQ		0xdf
+#define ELE_SERVICE_SWAP_REQ_MSG_SZ	0x18
+#define ELE_SERVICE_SWAP_RSP_MSG_SZ	0x0c
+#define ELE_IMEM_SIZE			0x10000
+#define ELE_IMEM_STATE_OK		0xca
+#define ELE_IMEM_STATE_BAD		0xfe
+#define ELE_IMEM_STATE_WORD		0x27
+#define ELE_IMEM_STATE_MASK		0x00ff0000
+#define ELE_IMEM_EXPORT			0x1
+#define ELE_IMEM_IMPORT			0x2
+
+#define ELE_FW_AUTH_REQ			0x02
+#define ELE_FW_AUTH_REQ_SZ		0x10
+#define ELE_FW_AUTH_RSP_MSG_SZ		0x08
+
+int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info);
+int ele_fetch_soc_info(struct se_if_priv *priv, void *data);
+int ele_ping(struct se_if_priv *priv);
+int ele_service_swap(struct se_if_priv *priv, dma_addr_t addr,
+		     u32 addr_size, u16 flag);
+int ele_fw_authenticate(struct se_if_priv *priv, dma_addr_t contnr_addr,
+			dma_addr_t img_addr);
+int ele_debug_dump(struct se_if_priv *priv);
+#endif
diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
new file mode 100644
index 000000000000..e9405a82c54d
--- /dev/null
+++ b/drivers/firmware/imx/ele_common.c
@@ -0,0 +1,469 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2025 NXP
+ */
+
+#include "ele_base_msg.h"
+#include "ele_common.h"
+
+/*
+ * se_update_msg_chksum() - calculate and update message checksum word.
+ * @msg: message buffer.
+ * @msg_len: message length in bytes.
+ *
+ * The message length must be 4-byte aligned. The last word is treated as the
+ * checksum field and is not included in the checksum calculation.
+ *
+ * Return:
+ * 0 on success, negative errno on failure.
+ */
+int se_update_msg_chksum(u32 *msg, u32 msg_len)
+{
+	u32 nb_words;
+	u32 chksum = 0;
+	u32 i;
+
+	if (!msg)
+		return -EINVAL;
+
+	if (msg_len % SE_MSG_WORD_SZ) {
+		pr_err("Msg-len is not 4-byte aligned.\n");
+		return -EINVAL;
+	}
+
+	nb_words = msg_len / sizeof(*msg);
+	if (nb_words < 5)
+		return -EINVAL;
+
+	/* Last word is the checksum word, so skip it. */
+	nb_words--;
+
+	for (i = 0; i < nb_words; i++)
+		chksum ^= msg[i];
+
+	msg[nb_words] = chksum;
+
+	return 0;
+}
+
+int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
+{
+	bool wait_uninterruptible = false;
+	unsigned long remaining_jiffies;
+	unsigned long flags;
+	int ret;
+
+	remaining_jiffies = msecs_to_jiffies(SE_RCV_MSG_DEFAULT_TIMEOUT_MS);
+	do {
+		if (wait_uninterruptible)
+			ret = wait_for_completion_timeout(&se_clbk_hdl->done,
+							  remaining_jiffies);
+		else
+			ret = wait_for_completion_interruptible_timeout(&se_clbk_hdl->done,
+									remaining_jiffies);
+		if (ret == -ERESTARTSYS) {
+			/*
+			 * Record that a signal was observed, then continue waiting non-
+			 * interruptibly until the response arrives or the timeout
+			 * expires. The caller can surface the interruption to userspace
+			 * after the protocol transaction is brought back to a
+			 * synchronized state.
+			 */
+			if (se_clbk_hdl == &priv->waiting_rsp_clbk_hdl &&
+			    READ_ONCE(se_clbk_hdl->rx_msg)) {
+				WRITE_ONCE(se_clbk_hdl->signal_rcvd, true);
+				wait_uninterruptible = true;
+				continue;
+			}
+			break;
+		}
+
+		if (ret == 0) {
+			/*
+			 * The response buffer belongs to the caller of ele_msg_send_rcv()
+			 * and may be freed as soon as this function returns. Clear rx_msg
+			 * under clbk_rx_lock so that a late se_if_rx_callback() can
+			 * observe that the waiter has timed out and must not copy into
+			 * the stale buffer.
+			 *
+			 * If the completion has not yet been signaled, mark the firmware
+			 * path busy. This acts as a circuit breaker: reject new
+			 * command/response transactions until the delayed response
+			 * arrives and the callback closes the breaker.
+			 */
+
+			spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
+			se_clbk_hdl->rx_msg = NULL;
+			if (!completion_done(&se_clbk_hdl->done))
+				atomic_set(&priv->fw_busy, 1);
+
+			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
+			ret = -ETIMEDOUT;
+			dev_err(priv->dev,
+				"Fatal Error: SE interface %s0, hangs indefinitely.\n",
+				get_se_if_name(priv->if_defs->se_if_type));
+			break;
+		}
+		ret = se_clbk_hdl->rx_msg_sz;
+		break;
+	} while (ret < 0);
+
+	return ret;
+}
+
+int ele_msg_send(struct se_if_priv *priv,
+		 void *tx_msg,
+		 int tx_msg_sz)
+{
+	struct se_msg_hdr *header = tx_msg;
+	int err;
+
+	/*
+	 * Check that the size passed as argument matches the size
+	 * carried in the message.
+	 */
+	if (header->size << 2 != tx_msg_sz) {
+		dev_err(priv->dev,
+			"User buf hdr: 0x%x, sz mismatced with input-sz (%d != %d).",
+			*(u32 *)header, header->size << 2, tx_msg_sz);
+		return -EINVAL;
+	}
+
+	/*
+	 * The i.MX MU mailbox controller copies the payload words into MU
+	 * registers synchronously from its send path. It does not retain the
+	 * caller-provided tx_msg pointer after mbox_send_message() returns, so
+	 * the caller-owned buffer may be released after a successful send.
+	 */
+	err = mbox_send_message(priv->tx_chan, tx_msg);
+	if (err < 0) {
+		dev_err(priv->dev, "Error: mbox_send_message failure.\n");
+		return err;
+	}
+
+	return tx_msg_sz;
+}
+
+static void ele_msg_send_rcv_cleanup(struct se_if_priv *priv)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
+	priv->waiting_rsp_clbk_hdl.rx_msg = NULL;
+	priv->waiting_rsp_clbk_hdl.rx_msg_sz = 0;
+	spin_unlock_irqrestore(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
+}
+
+/* API used for send/receive blocking call. */
+int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
+		     void *rx_msg, int exp_rx_msg_sz)
+{
+	int err;
+
+	guard(mutex)(&priv->se_if_cmd_lock);
+
+	if (atomic_read(&priv->fw_busy)) {
+		dev_dbg(priv->dev, "ELE became unresponsive.\n");
+		return -EBUSY;
+	}
+	reinit_completion(&priv->waiting_rsp_clbk_hdl.done);
+	priv->waiting_rsp_clbk_hdl.rx_msg_sz = exp_rx_msg_sz;
+	priv->waiting_rsp_clbk_hdl.rx_msg = rx_msg;
+
+	err = ele_msg_send(priv, tx_msg, tx_msg_sz);
+	if (err < 0) {
+		ele_msg_send_rcv_cleanup(priv);
+		return err;
+	}
+
+	err = ele_msg_rcv(priv, &priv->waiting_rsp_clbk_hdl);
+
+	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
+		/*
+		 * A signal was received after the command was sent. ele_msg_rcv()
+		 * kept waiting until the FW/kernel protocol was synchronized again.
+		 * If the transaction itself completed successfully, report the
+		 * deferred signal to userspace using normal syscall-restart semantics.
+		 * Do not hide real firmware/protocol errors such as -ETIMEDOUT.
+		 */
+		if (err > 0)
+			err = -ERESTARTSYS;
+		priv->waiting_rsp_clbk_hdl.signal_rcvd = false;
+		dev_dbg(priv->dev, "Err[0x%x]:Interrupted by signal.", err);
+	}
+
+	ele_msg_send_rcv_cleanup(priv);
+
+	return err;
+}
+
+static bool check_hdr_exception_for_sz(struct se_if_priv *priv,
+				       struct se_msg_hdr *header)
+{
+	/*
+	 * List of API headers that can accept a variable length response buffer.
+	 */
+	if (header->command == ELE_DEBUG_DUMP_REQ &&
+	    header->ver == priv->if_defs->base_api_ver &&
+	    header->size >= 2 && header->size <= (ELE_DEBUG_DUMP_RSP_SZ / 4))
+		return true;
+
+	return false;
+}
+
+/*
+ * Callback called by mailbox FW, when data is received.
+ */
+void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
+{
+	struct se_clbk_handle *se_clbk_hdl;
+	struct device *dev = mbox_cl->dev;
+	struct se_msg_hdr *header;
+	bool sz_mismatch = false;
+	struct se_if_priv *priv;
+	unsigned long flags;
+	u32 rx_msg_sz;
+
+	priv = dev_get_drvdata(dev);
+
+	/* The function can be called with NULL msg */
+	if (IS_ERR_OR_NULL(msg)) {
+		dev_err(dev, "Message is invalid\n");
+		return;
+	}
+
+	header = msg;
+	rx_msg_sz = header->size << 2;
+
+	/* Incoming command: wake up the receiver if any. */
+	if (header->tag == priv->if_defs->cmd_tag) {
+		se_clbk_hdl = &priv->cmd_receiver_clbk_hdl;
+		spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
+		if (!se_clbk_hdl->rx_msg) {
+			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
+			dev_warn(dev, "No command receiver registered for message: %.8x\n",
+				 *((u32 *)header));
+			return;
+		}
+
+		/*
+		 * cmd_tag messages are delivered only to the explicitly registered
+		 * command receiver. Unlike the synchronous response waiter path, the
+		 * command receiver uses a dedicated long-lived buffer installed by
+		 * SE_IOCTL_ENABLE_CMD_RCV and is not subject to the timeout/circuit-
+		 * breaker handling used for rsp_tag messages.
+		 */
+		dev_dbg(dev, "Selecting cmd receiver: for mesg header:0x%x.",
+			*(u32 *)header);
+
+		/*
+		 * Pre-allocated buffer of MAX_NVM_MSG_LEN
+		 * as the NVM command are initiated by FW.
+		 * Size is revealed as part of this call function.
+		 */
+
+		if (rx_msg_sz > MAX_NVM_MSG_LEN) {
+			/* Store the response buffer maxsize in local variable.*/
+			rx_msg_sz = MAX_NVM_MSG_LEN;
+			sz_mismatch = true;
+		}
+
+		se_clbk_hdl->rx_msg_sz = rx_msg_sz;
+		memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
+		complete(&se_clbk_hdl->done);
+		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
+		if (sz_mismatch)
+			dev_err(dev,
+				"CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
+				*(u32 *)header,
+				(header->size << 2), rx_msg_sz);
+	} else if (header->tag == priv->if_defs->rsp_tag) {
+		bool exception_for_sz_mismatch = check_hdr_exception_for_sz(priv, header);
+		u32 exp_rx_msg_sz = 0;
+
+		/*
+		 * waiting_rsp_clbk_hdl.rx_msg is owned by the synchronous sender in
+		 * ele_msg_send_rcv(). After timeout or error, that path clears rx_msg
+		 * under clbk_rx_lock before returning to its caller, which may then free
+		 * the buffer. Check rx_msg under the same lock here so a delayed response
+		 * can be detected and dropped instead of copying into freed memory.
+		 *
+		 * A late response also closes the firmware-busy circuit breaker, allowing
+		 * future command/response transactions to proceed again.
+		 */
+		se_clbk_hdl = &priv->waiting_rsp_clbk_hdl;
+		exp_rx_msg_sz = se_clbk_hdl->rx_msg_sz;
+		spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
+		if (!se_clbk_hdl->rx_msg) {
+			/* Close circuit breaker on spinlock race */
+			atomic_set(&priv->fw_busy, 0);
+			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
+			dev_info(dev, "ELE responded (late), recovery FW available.");
+			return;
+		}
+		dev_dbg(dev, "Selecting resp waiter: for mesg header:0x%x.",
+			*(u32 *)header);
+
+		/*
+		 * For rsp_tag traffic, the sender provides the expected response
+		 * buffer size. If firmware returns a different size, clamp the copy
+		 * length to the caller's buffer capacity before memcpy() and report the
+		 * mismatch after dropping the spinlock.
+		 */
+		if (rx_msg_sz != exp_rx_msg_sz) {
+			if (!exception_for_sz_mismatch)
+				sz_mismatch = true;
+
+			se_clbk_hdl->rx_msg_sz = min(rx_msg_sz, exp_rx_msg_sz);
+		}
+		memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
+		complete(&se_clbk_hdl->done);
+		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
+
+		if (sz_mismatch)
+			dev_err(dev,
+				"Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
+				*(u32 *)header,
+				(header->size << 2), exp_rx_msg_sz);
+	} else {
+		dev_err(dev, "Failed to select a device for message: %.8x\n",
+			*((u32 *)header));
+	}
+}
+
+int se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
+			    u8 msg_id, u8 sz, bool is_base_api)
+{
+	struct se_msg_hdr *header = &msg->header;
+	u32 status;
+
+	if (header->tag != priv->if_defs->rsp_tag) {
+		dev_err(priv->dev, "MSG[0x%x] Hdr: Resp tag mismatch. (0x%x != 0x%x)",
+			msg_id, header->tag, priv->if_defs->rsp_tag);
+		return -EINVAL;
+	}
+
+	if (header->command != msg_id) {
+		dev_err(priv->dev, "MSG Header: Cmd id mismatch. (0x%x != 0x%x)",
+			header->command, msg_id);
+		return -EINVAL;
+	}
+
+	if ((sz % 4) || (header->size != (sz >> 2) &&
+			 !check_hdr_exception_for_sz(priv, header))) {
+		dev_err(priv->dev, "MSG[0x%x] Hdr: Cmd size mismatch. (0x%x != 0x%x)",
+			msg_id, header->size, (sz >> 2));
+		return -EINVAL;
+	}
+
+	if (is_base_api && header->ver != priv->if_defs->base_api_ver) {
+		dev_err(priv->dev,
+			"MSG[0x%x] Hdr: Base API Vers mismatch. (0x%x != 0x%x)",
+			msg_id, header->ver, priv->if_defs->base_api_ver);
+		return -EINVAL;
+	} else if (!is_base_api && header->ver != priv->if_defs->fw_api_ver) {
+		dev_err(priv->dev,
+			"MSG[0x%x] Hdr: FW API Vers mismatch. (0x%x != 0x%x)",
+			msg_id, header->ver, priv->if_defs->fw_api_ver);
+		return -EINVAL;
+	}
+
+	status = RES_STATUS(msg->data[0]);
+	if (status != priv->if_defs->success_tag) {
+		dev_err(priv->dev, "Command Id[%x], Response Failure = 0x%x",
+			header->command, status);
+		return -EPERM;
+	}
+
+	return 0;
+}
+
+int se_save_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem)
+{
+	struct ele_dev_info s_info = {0};
+	int ret;
+
+	ret = ele_get_info(priv, &s_info);
+	if (ret) {
+		dev_err(priv->dev, "Failed to get info from ELE.\n");
+		return ret;
+	}
+
+	/* Check for the imem-state before continue to save imem state. */
+	if (s_info.d_addn_info.imem_state == ELE_IMEM_STATE_BAD)
+		return 0;
+
+	/*
+	 * EXPORT command will save encrypted IMEM to given address,
+	 * so later in resume, IMEM can be restored from the given
+	 * address.
+	 *
+	 * Size must be at least 64 kB.
+	 */
+	ret = ele_service_swap(priv, imem->daddr, ELE_IMEM_SIZE, ELE_IMEM_EXPORT);
+	if (ret < 0) {
+		dev_err(priv->dev, "Failed to export IMEM.");
+		imem->size = 0;
+	} else if (ret > ELE_IMEM_SIZE) {
+		dev_err(priv->dev, "Invalid exported IMEM size %d.", ret);
+		imem->size = 0;
+		ret = -EIO;
+	} else {
+		dev_dbg(priv->dev,
+			"Exported %d bytes of encrypted IMEM.",
+			ret);
+		imem->size = ret;
+	}
+
+	return ret > 0 ? 0 : ret;
+}
+
+int se_restore_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem)
+{
+	struct ele_dev_info s_info;
+	int ret;
+
+	/* get info from ELE */
+	ret = ele_get_info(priv, &s_info);
+	if (ret) {
+		dev_err(priv->dev, "Failed to get info from ELE.");
+		return ret;
+	}
+	imem->state = s_info.d_addn_info.imem_state;
+
+	/* Check for the imem-state and imem-size before continue to
+	 * restore imem state.
+	 */
+	if (s_info.d_addn_info.imem_state != ELE_IMEM_STATE_BAD || !imem->size)
+		return 0;
+
+	/*
+	 * IMPORT command will restore IMEM from the given
+	 * address, here size is the actual size returned by ELE
+	 * during the export operation
+	 */
+	ret = ele_service_swap(priv, imem->daddr, imem->size, ELE_IMEM_IMPORT);
+	if (ret) {
+		dev_err(priv->dev, "Failed to import IMEM");
+		return ret;
+	}
+
+	/*
+	 * After importing IMEM, check if IMEM state is equal to 0xCA
+	 * to ensure IMEM is fully loaded and
+	 * ELE functionality can be used.
+	 */
+	ret = ele_get_info(priv, &s_info);
+	if (ret) {
+		dev_err(priv->dev, "Failed to get info from ELE.");
+		return ret;
+	}
+	imem->state = s_info.d_addn_info.imem_state;
+
+	if (s_info.d_addn_info.imem_state == ELE_IMEM_STATE_OK)
+		dev_dbg(priv->dev, "Successfully restored IMEM.");
+	else
+		dev_err(priv->dev, "Failed to restore IMEM.");
+
+	return ret;
+}
diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
new file mode 100644
index 000000000000..7bf2febefc45
--- /dev/null
+++ b/drivers/firmware/imx/ele_common.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef __ELE_COMMON_H__
+#define __ELE_COMMON_H__
+
+#include "se_ctrl.h"
+
+#define SE_RCV_MSG_DEFAULT_TIMEOUT_MS	3000
+
+#define ELE_SUCCESS_IND			0xD6
+
+#define IMX_ELE_FW_DIR                 "imx/ele/"
+
+int se_update_msg_chksum(u32 *msg, u32 msg_len);
+
+int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl);
+
+int ele_msg_send(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz);
+
+int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
+		     void *rx_msg, int exp_rx_msg_sz);
+
+void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg);
+
+int se_val_rsp_hdr_n_status(struct se_if_priv *priv, struct se_api_msg *msg,
+			    u8 msg_id, u8 sz, bool is_base_api);
+
+/* Fill a command message header with a given command ID and length in bytes. */
+static inline void se_fill_cmd_msg_hdr(struct se_if_priv *priv, struct se_msg_hdr *hdr,
+				       u8 cmd, u32 len, bool is_base_api)
+{
+	hdr->tag = priv->if_defs->cmd_tag;
+	hdr->ver = (is_base_api) ? priv->if_defs->base_api_ver : priv->if_defs->fw_api_ver;
+	hdr->command = cmd;
+	hdr->size = len >> 2;
+}
+
+int se_save_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem);
+
+int se_restore_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem);
+
+#endif /*__ELE_COMMON_H__ */
diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
new file mode 100644
index 000000000000..06068c4db8c1
--- /dev/null
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -0,0 +1,459 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2026 NXP
+ */
+
+#include <linux/bitfield.h>
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/dev_printk.h>
+#include <linux/dma-direct.h>
+#include <linux/dma-mapping.h>
+#include <linux/errno.h>
+#include <linux/export.h>
+#include <linux/firmware.h>
+#include <linux/firmware/imx/se_api.h>
+#include <linux/genalloc.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/sys_soc.h>
+
+#include "ele_base_msg.h"
+#include "ele_common.h"
+#include "se_ctrl.h"
+
+#define MAX_SOC_INFO_DATA_SZ		256
+#define MBOX_TX_NAME			"tx"
+#define MBOX_RX_NAME			"rx"
+
+#define SE_TYPE_STR_DBG			"dbg"
+#define SE_TYPE_STR_HSM			"hsm"
+
+#define SE_TYPE_ID_DBG			0x1
+
+#define SE_TYPE_ID_HSM			0x2
+
+struct se_var_info {
+	u16 soc_rev;
+	bool soc_dev_registered;
+	/* To serialize populating common SoC level info. */
+	struct mutex se_var_info_lock;
+};
+
+/* contains fixed information */
+struct se_soc_info {
+	const u16 soc_id;
+	const char *soc_name;
+	const struct se_fw_img_name se_fw_img_nm;
+	bool imem_state_mgmt;
+};
+
+struct se_if_node {
+	struct se_soc_info *se_info;
+	u8 *pool_name;
+	bool reserved_dma_ranges;
+	struct se_if_defines if_defs;
+};
+
+/* common for all the SoC. */
+static struct se_var_info var_se_info = {
+	.soc_rev = 0,
+	.se_var_info_lock = __MUTEX_INITIALIZER(var_se_info.se_var_info_lock)
+};
+
+static struct se_soc_info se_imx8ulp_info = {
+	.soc_id = SOC_ID_OF_IMX8ULP,
+	.soc_name = "i.MX8ULP",
+	.se_fw_img_nm = {
+		.prim_fw_nm_in_rfs = IMX_ELE_FW_DIR
+			"mx8ulpa2-ahab-container.img",
+		.seco_fw_nm_in_rfs = IMX_ELE_FW_DIR
+			"mx8ulpa2ext-ahab-container.img",
+	},
+	.imem_state_mgmt = true,
+};
+
+static struct se_if_node imx8ulp_se_ele_hsm = {
+	.se_info = &se_imx8ulp_info,
+	.pool_name = "sram",
+	.reserved_dma_ranges = true,
+	.if_defs = {
+		.se_if_type = SE_TYPE_ID_HSM,
+		.cmd_tag = 0x17,
+		.rsp_tag = 0xe1,
+		.success_tag = ELE_SUCCESS_IND,
+		.base_api_ver = MESSAGING_VERSION_6,
+		.fw_api_ver = MESSAGING_VERSION_7,
+	},
+};
+
+static struct se_soc_info se_imx93_info = {
+	.soc_id = SOC_ID_OF_IMX93,
+};
+
+static struct se_if_node imx93_se_ele_hsm = {
+	.se_info = &se_imx93_info,
+	.reserved_dma_ranges = true,
+	.if_defs = {
+		.se_if_type = SE_TYPE_ID_HSM,
+		.cmd_tag = 0x17,
+		.rsp_tag = 0xe1,
+		.success_tag = ELE_SUCCESS_IND,
+		.base_api_ver = MESSAGING_VERSION_6,
+		.fw_api_ver = MESSAGING_VERSION_7,
+	},
+};
+
+static const struct of_device_id se_match[] = {
+	{ .compatible = "fsl,imx8ulp-se-ele-hsm", .data = &imx8ulp_se_ele_hsm },
+	{ .compatible = "fsl,imx93-se-ele-hsm", .data = &imx93_se_ele_hsm },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, se_match);
+
+char *get_se_if_name(u8 se_if_id)
+{
+	switch (se_if_id) {
+	case SE_TYPE_ID_DBG: return SE_TYPE_STR_DBG;
+	case SE_TYPE_ID_HSM: return SE_TYPE_STR_HSM;
+	}
+
+	return "unknown";
+}
+
+static struct se_fw_load_info *get_load_fw_instance(struct se_if_priv *priv)
+{
+	return &priv->load_fw;
+}
+
+static void se_soc_device_unregister(void *data)
+{
+	struct soc_device *sdev = data;
+
+	soc_device_unregister(sdev);
+	var_se_info.soc_dev_registered = false;
+}
+
+/*
+ * Build and register a soc_device entry for this SoC. Separated from
+ * get_se_soc_info() so that the firmware-fetch path and the sysfs
+ * registration path can be reasoned about independently.
+ */
+static int se_soc_dev_register(struct se_if_priv *priv, u16 soc_rev,
+			       const char *soc_name, const u8 *uid)
+{
+	struct soc_device_attribute *attr;
+	struct soc_device *sdev;
+	int err;
+
+	if (!soc_rev || !soc_name || !uid)
+		return -EINVAL;
+
+	attr = devm_kzalloc(priv->dev, sizeof(*attr), GFP_KERNEL);
+	if (!attr)
+		return -ENOMEM;
+
+	if (FIELD_GET(DEV_GETINFO_MIN_VER_MASK, soc_rev))
+		attr->revision = devm_kasprintf(priv->dev, GFP_KERNEL, "%x.%x",
+						FIELD_GET(DEV_GETINFO_MAJ_VER_MASK, soc_rev),
+						FIELD_GET(DEV_GETINFO_MIN_VER_MASK, soc_rev));
+	else
+		attr->revision = devm_kasprintf(priv->dev, GFP_KERNEL, "%x",
+						FIELD_GET(DEV_GETINFO_MAJ_VER_MASK, soc_rev));
+
+	if (!attr->revision)
+		return -ENOMEM;
+
+	attr->soc_id = soc_name;
+
+	err = of_property_read_string(of_root, "model", &attr->machine);
+	if (err)
+		return -EINVAL;
+
+	attr->family = "Freescale i.MX";
+
+	attr->serial_number = devm_kasprintf(priv->dev, GFP_KERNEL, "%016llX",
+					     GET_SERIAL_NUM_FROM_UID(uid, MAX_UID_SIZE >> 2));
+	if (!attr->serial_number)
+		return -ENOMEM;
+
+	sdev = soc_device_register(attr);
+	if (IS_ERR(sdev))
+		return PTR_ERR(sdev);
+
+	err = devm_add_action_or_reset(priv->dev, se_soc_device_unregister, sdev);
+	if (err)
+		return err;
+
+	/* Mark registration complete so get_se_soc_info() skips this path on retry. */
+	var_se_info.soc_dev_registered = true;
+
+	return 0;
+}
+
+static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se_info)
+{
+	struct se_fw_load_info *load_fw = get_load_fw_instance(priv);
+	u8 data[MAX_SOC_INFO_DATA_SZ];
+	struct ele_dev_info *s_info;
+	int err;
+
+	guard(mutex)(&var_se_info.se_var_info_lock);
+
+	/*
+	 * Early exit: both objectives already complete, nothing to do.
+	 */
+	if (var_se_info.soc_rev &&
+	    (!se_info->soc_name || var_se_info.soc_dev_registered))
+		return 0;
+
+	err = ele_fetch_soc_info(priv, &data);
+	if (err < 0)
+		return dev_err_probe(priv->dev, err, "Failed to fetch SoC Info.");
+
+	s_info = (struct ele_dev_info *)data;
+
+	if (!var_se_info.soc_rev) {
+		var_se_info.soc_rev = s_info->d_info.soc_rev;
+
+		/*
+		 * Only update IMEM state when the load_fw path is active;
+		 * on SoCs without IMEM management (e.g. i.MX93) the field
+		 * is not meaningful.
+		 */
+		if (load_fw->imem_mgmt)
+			load_fw->imem.state = s_info->d_addn_info.imem_state;
+	}
+
+	if (se_info->soc_name && !var_se_info.soc_dev_registered) {
+		err = se_soc_dev_register(priv, var_se_info.soc_rev,
+					  se_info->soc_name, s_info->d_info.uid);
+		if (err < 0)
+			return dev_err_probe(priv->dev, err,
+					     "Failed to register SE SoC device.");
+	}
+
+	return 0;
+}
+
+/* interface for managed res to free a mailbox channel */
+static void if_mbox_free_channel(void *mbox_chan)
+{
+	mbox_free_channel(mbox_chan);
+}
+
+static int se_if_request_channel(struct device *dev, struct mbox_chan **chan,
+				 struct mbox_client *cl, const char *name)
+{
+	struct mbox_chan *t_chan;
+	int ret = 0;
+
+	t_chan = mbox_request_channel_byname(cl, name);
+	if (IS_ERR(t_chan))
+		return dev_err_probe(dev, PTR_ERR(t_chan),
+				     "Failed to request %s channel.", name);
+
+	ret = devm_add_action_or_reset(dev, if_mbox_free_channel, t_chan);
+	if (ret)
+		return dev_err_probe(dev, -EPERM,
+				     "Failed to add-action for removal of mbox: %s.",
+				     name);
+	*chan = t_chan;
+
+	return ret;
+}
+
+static void se_if_probe_cleanup(void *plat_dev)
+{
+	struct platform_device *pdev = plat_dev;
+	struct device *dev = &pdev->dev;
+	struct se_if_priv *priv;
+
+	priv = dev_get_drvdata(dev);
+	if (!priv)
+		return;
+
+	/*
+	 * In se_if_request_channel(), passed the clean-up functional
+	 * pointer reference as action to devm_add_action_or_reset().
+	 * No need to free the mbox channels here.
+	 */
+
+	/*
+	 * Being device managed buffer, no need to free the buffer allocated
+	 * in se probe to store encrypted IMEM.
+	 */
+
+	/*
+	 * No need to check, if reserved memory is allocated
+	 * before calling for its release. Or clearing the
+	 * un-set bit.
+	 */
+	of_reserved_mem_device_release(dev);
+
+	dev_set_drvdata(dev, NULL);
+	kfree(priv);
+}
+
+static int se_if_probe(struct platform_device *pdev)
+{
+	const struct se_soc_info *se_info;
+	const struct se_if_node *if_node;
+	struct se_fw_load_info *load_fw;
+	struct device *dev = &pdev->dev;
+	struct se_if_priv *priv;
+	int ret;
+
+	if_node = device_get_match_data(dev);
+	if (!if_node)
+		return -EINVAL;
+
+	se_info = if_node->se_info;
+
+	priv = kzalloc_obj(*priv, GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+	priv->if_defs = &if_node->if_defs;
+	dev_set_drvdata(dev, priv);
+
+	mutex_init(&priv->se_if_cmd_lock);
+	spin_lock_init(&priv->cmd_receiver_clbk_hdl.clbk_rx_lock);
+	spin_lock_init(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock);
+	atomic_set(&priv->fw_busy, 0);
+	init_completion(&priv->waiting_rsp_clbk_hdl.done);
+	init_completion(&priv->cmd_receiver_clbk_hdl.done);
+
+	/* Mailbox client configuration */
+	priv->se_mb_cl.dev		= dev;
+	priv->se_mb_cl.tx_block		= false;
+	priv->se_mb_cl.knows_txdone	= false;
+	priv->se_mb_cl.rx_callback	= se_if_rx_callback;
+
+	ret = se_if_request_channel(dev, &priv->tx_chan, &priv->se_mb_cl, MBOX_TX_NAME);
+	if (ret)
+		return ret;
+
+	ret = se_if_request_channel(dev, &priv->rx_chan, &priv->se_mb_cl, MBOX_RX_NAME);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, se_if_probe_cleanup, pdev);
+	if (ret)
+		return ret;
+
+	if (if_node->pool_name) {
+		priv->mem_pool = of_gen_pool_get(dev->of_node, if_node->pool_name, 0);
+		if (!priv->mem_pool)
+			return dev_err_probe(dev, -ENOMEM,
+					     "Unable to get sram pool = %s.",
+					     if_node->pool_name);
+	}
+
+	if (if_node->reserved_dma_ranges) {
+		ret = of_reserved_mem_device_init(dev);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					    "Failed to init reserved memory region.");
+	}
+
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to set 32-bit coherent DMA mask.");
+
+	/*
+	 * Initialize load_fw_lock before registering the misc device.
+	 * A userspace process could open the device and trigger se_load_firmware()
+	 * via IOCTL immediately after misc_register(), so the mutex must be ready
+	 * before the device becomes visible.
+	 */
+	if (se_info->se_fw_img_nm.seco_fw_nm_in_rfs) {
+		load_fw = get_load_fw_instance(priv);
+		mutex_init(&load_fw->load_fw_lock);
+		load_fw->se_fw_img_nm = &se_info->se_fw_img_nm;
+		load_fw->is_fw_tobe_loaded = true;
+	}
+
+	/* By default, there is no pending FW to be loaded.*/
+	if (se_info->imem_state_mgmt) {
+		load_fw = get_load_fw_instance(priv);
+
+		/* allocate buffer where SE store encrypted IMEM */
+		load_fw->imem.buf = dmam_alloc_coherent(priv->dev, ELE_IMEM_SIZE,
+							&load_fw->imem.daddr,
+							GFP_KERNEL);
+		if (!load_fw->imem.buf)
+			return dev_err_probe(dev, -ENOMEM,
+					     "dmam-alloc-failed: To store encr-IMEM.");
+		load_fw->imem_mgmt = true;
+	}
+
+	if (if_node->if_defs.se_if_type == SE_TYPE_ID_HSM) {
+		ret = get_se_soc_info(priv, se_info);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to fetch SoC Info.");
+	}
+
+	dev_info(dev, "i.MX secure-enclave: %s0 interface to firmware, configured.",
+		 get_se_if_name(priv->if_defs->se_if_type));
+
+	return ret;
+}
+
+static int se_suspend(struct device *dev)
+{
+	struct se_if_priv *priv = dev_get_drvdata(dev);
+	struct se_fw_load_info *load_fw;
+	int ret = 0;
+
+	load_fw = get_load_fw_instance(priv);
+
+	if (load_fw->imem_mgmt) {
+		ret = se_save_imem_state(priv, &load_fw->imem);
+		if (ret)
+			dev_warn(dev, "Failure saving IMEM state[0x%x]", ret);
+	}
+
+	return 0;
+}
+
+static int se_resume(struct device *dev)
+{
+	struct se_if_priv *priv = dev_get_drvdata(dev);
+	struct se_fw_load_info *load_fw;
+	int ret = 0;
+
+	load_fw = get_load_fw_instance(priv);
+
+	if (load_fw->imem_mgmt) {
+		ret = se_restore_imem_state(priv, &load_fw->imem);
+		if (ret)
+			dev_warn(dev, "Failure restoring IMEM state[0x%x]", ret);
+	}
+
+	return 0;
+}
+
+DEFINE_SIMPLE_DEV_PM_OPS(se_pm, se_suspend, se_resume);
+
+static struct platform_driver se_driver = {
+	.driver = {
+		.name = "fsl-se",
+		.of_match_table = se_match,
+		.pm = pm_sleep_ptr(&se_pm),
+	},
+	.probe = se_if_probe,
+};
+module_platform_driver(se_driver);
+
+MODULE_AUTHOR("Pankaj Gupta <pankaj.gupta@nxp.com>");
+MODULE_DESCRIPTION("iMX Secure Enclave Driver.");
+MODULE_LICENSE("GPL");
diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
new file mode 100644
index 000000000000..18706b01d81c
--- /dev/null
+++ b/drivers/firmware/imx/se_ctrl.h
@@ -0,0 +1,111 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2026 NXP
+ */
+
+#ifndef SE_CTRL_H
+#define SE_CTRL_H
+
+#include <linux/bitfield.h>
+#include <linux/miscdevice.h>
+#include <linux/semaphore.h>
+#include <linux/mailbox_client.h>
+
+#define MAX_FW_LOAD_RETRIES		50
+#define SE_MSG_WORD_SZ			0x4
+
+#define RES_STATUS(x)			FIELD_GET(0x000000ff, x)
+#define MAX_NVM_MSG_LEN			(256)
+#define MESSAGING_VERSION_6		0x6
+#define MESSAGING_VERSION_7		0x7
+
+struct se_clbk_handle {
+	struct completion done;
+	bool signal_rcvd;
+	u32 rx_msg_sz;
+	/*
+	 * Assignment of the rx_msg buffer to held till the
+	 * received content as part callback function, is copied.
+	 */
+	struct se_api_msg *rx_msg;
+	/*
+	 * Serialise the timeout path in ele_msg_rcv() against
+	 * se_if_rx_callback() so that the callback can never
+	 * memcpy into a buffer that the timeout path has already
+	 * freed.
+	 */
+	spinlock_t clbk_rx_lock;
+};
+
+struct se_imem_buf {
+	u8 *buf;
+	dma_addr_t daddr;
+	u32 size;
+	u32 state;
+};
+
+/* Header of the messages exchange with the EdgeLock Enclave */
+struct se_msg_hdr {
+	u8 ver;
+	u8 size;
+	u8 command;
+	u8 tag;
+}  __packed;
+
+#define SE_MU_HDR_SZ	4
+
+struct se_api_msg {
+	struct se_msg_hdr header;
+	u32 data[];
+};
+
+struct se_if_defines {
+	const u8 se_if_type;
+	u8 cmd_tag;
+	u8 rsp_tag;
+	u8 success_tag;
+	u8 base_api_ver;
+	u8 fw_api_ver;
+};
+
+struct se_fw_img_name {
+	const char *prim_fw_nm_in_rfs;
+	const char *seco_fw_nm_in_rfs;
+};
+
+struct se_fw_load_info {
+	const struct se_fw_img_name *se_fw_img_nm;
+	bool is_fw_tobe_loaded;
+	bool imem_mgmt;
+	struct se_imem_buf imem;
+	/* to serialize the fw load state */
+	struct mutex load_fw_lock;
+};
+
+struct se_if_priv {
+	struct device *dev;
+
+	struct se_clbk_handle cmd_receiver_clbk_hdl;
+	/*
+	 * Update to the waiting_rsp_dev, to be protected
+	 * under se_if_cmd_lock.
+	 */
+	struct se_clbk_handle waiting_rsp_clbk_hdl;
+	/*
+	 * prevent new command to be sent on the se interface while previous
+	 * command is still processing. (response is awaited)
+	 */
+	struct mutex se_if_cmd_lock;
+
+	struct mbox_client se_mb_cl;
+	struct mbox_chan *tx_chan, *rx_chan;
+
+	struct gen_pool *mem_pool;
+	const struct se_if_defines *if_defs;
+	struct se_fw_load_info load_fw;
+
+	atomic_t fw_busy;
+};
+
+char *get_se_if_name(u8 se_if_id);
+#endif
diff --git a/include/linux/firmware/imx/se_api.h b/include/linux/firmware/imx/se_api.h
new file mode 100644
index 000000000000..b1c4c9115d7b
--- /dev/null
+++ b/include/linux/firmware/imx/se_api.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef __SE_API_H__
+#define __SE_API_H__
+
+#include <linux/types.h>
+
+#define SOC_ID_OF_IMX8ULP		0x084d
+#define SOC_ID_OF_IMX93			0x9300
+
+#endif /* __SE_API_H__ */

-- 
2.43.0

