Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023140.outbound.protection.outlook.com [40.107.162.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485DE39A04B
	for <imx@lists.linux.dev>; Sun, 24 May 2026 14:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.140
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779634509; cv=fail; b=VgLOhkjGnaMp5RLIdHn8mxO7vBFXE206QdYfxGlq1YL+4S1xVTgf09CqTs1lqy4r/J2gVUlatfZDkKHig0IDWfqLebyjoDsvtaO4XV31xQDXz6zJc5mviTVK/w2alkfRgvrratuzSHhcxYbxZB6RzJkmF3pjSJZGENWh06V5ixg=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779634509; c=relaxed/simple;
	bh=8Li+c4xVQPNlJZfWcSCplSPzGEbgJZaR1KkIav3u/O8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=BQYfDTnssz+Py2KySiI/gxxhTwDzQHlXYflKFH5a7ITEH/ATuBuBHnoMtlyofqKEB3SlgWYFL7uwiYizTjEKzkVCT6lVF2naSW7YnYwVT3El0Lv9+5VAps7AD7ij7kUX7iiF1x780gDPizocAgFrlekyQRV7sSA04FalfszS32k=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=JXkrO91s; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=JXkrO91s; arc=fail smtp.client-ip=40.107.162.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="JXkrO91s";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="JXkrO91s"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=fail;
 b=IQQymP51ADjWGfDJrv+NCOSfUhW4DZdtFE/rfEBaiDxEDoMi1svJXhwzJOiL3E+5HBsP53Lu+ZeuBgcBxvPxo2FG2VUdIsHs8dZD0K1R0tE8iul0vEkmUKEIKU2b1Lhyw07d6aXlLGmGuFR2vzrI0uYWor4KOSd/v0NED/dYE3pUdM4bNLE4z2C9aPyrz3+uHy/HVsh+8MHUEsxJDQGzjoS2CnVuJa8ubBWc/c7tzfbdkn90guRvLW1nZzM8c5TDc9BvhEVkm+nPLZcf+f164yzy/HdRjJ8nzf8WKcYleJdNeYEaa+i9LRkOruG1XVG052mSGqNzAMHCnArWDl93Ig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7+RSZhNz8e3gJy6QxMr4STk12KQbbsSn07GRemjuLY=;
 b=ZZlZrk5oTuB9KGJJspp6YDoJOKBSlpLdS7BomJRF+mkd81JOQa0YhxHU6sKWHOoS0Tk09CZDuHW8FzMBisXtx7XShGVd2SHmjCFDENpr6KxcdZt9FnG5pssXosASpqfNbtcPKOM81DkI9G7CLSzK/FjFxUQWukm9FIucE/wN6U74K5ezd3lhtaCThOhwl/UGUcbmPhcW7XNlTEHO5KT9gPF12K4vuIsopNKKL85IWq0C8vQwGlRrUOtvJU/q5El/dBf5NSjaUMhfkGbDnvaoNTUuCsPF4HJYIkxYDtgMxlVPlcPVzJHktLaQJij14zMwV+fbDb58HaZfPrb9AooSpg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=fail (48)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7+RSZhNz8e3gJy6QxMr4STk12KQbbsSn07GRemjuLY=;
 b=JXkrO91sGw9hGlWKpcszJF8YpybAsV++a9CQO+rD8lpsQn2x2tKiFmJOTzwzu1J5glgvYytf1YkHewSbqnZeDRO8L88H6Ut1eRx82s0goSP2FBpcDf2oGEki4cgACoi5CIRbzZqKEBcqPhRqCuAJI59Us5AZhiY7+GRiuIdUq/lOs3sg8HD8FP5RK4VVDXEFVcDmDzH9mhMEsupH7qhLAL/26qqNGkDUTy93lXXj1r+vdPZQo3ZWxmgw07pAz/gIVPWtCaDnDr87+La/NvBqMqpxkyZADngoZwE6gwyjHHvt/NZjCKYpjCAvtv51/oP7rBb4xR+yszMn9ZzsqfCLPA==
Received: from CWLP265CA0411.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1b6::13)
 by AM9PR04MB8131.eurprd04.prod.outlook.com (2603:10a6:20b:3ed::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Sun, 24 May
 2026 14:54:58 +0000
Received: from AM3PEPF00009B9C.eurprd04.prod.outlook.com
 (2603:10a6:400:1b6:cafe::5f) by CWLP265CA0411.outlook.office365.com
 (2603:10a6:400:1b6::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.19 via Frontend Transport; Sun, 24
 May 2026 14:54:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM3PEPF00009B9C.mail.protection.outlook.com (10.167.16.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Sun, 24 May 2026 14:54:58 +0000
Received: from emails-748404-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-83.eu-west-1.compute.internal [10.20.6.83])
	by mta-outgoing-dlp-305-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 238CB7FE4F;
	Sun, 24 May 2026 14:54:58 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sun May 24 14:54:50 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T/q1Tu4i+5EDkMLL88kVyzODi7n9XKVXIDseph5WXSFTNIhi+cW6+C2PCVrOSHArW7rWH05PU1oVynln0yWFts6gjjOrjeJ5iw9V+8A0JyAlzd0v3EFglbIoEgaVAPmXQ3P7q2oPyI/SUhXnFcxClVi2L+BGPIruRAx4NHKMngPelMZBgKI1TwALVQCPltPqaCB9BNInBbVGnoOA1//+uXBP/czKab0o6abFhhFhxSuOZb739SRm9/H3ELxJNFHTAe3LnneX3jATbrVPIOA5BGsTeqj+Z4tPjer6dHBJOYtVVvGCtPLfDt8DTIjP+o+Th2IrzoEiSJJu1gC6RwLjeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7+RSZhNz8e3gJy6QxMr4STk12KQbbsSn07GRemjuLY=;
 b=PZC60Wo6JdZ5xT3AE1Rc9Hu6aOhDd6VjKYhwEKPA/FS9wo+NRhKKhlb8JVy+vwWax267oqlz6FbMAPXOQq/Al9xmdfkkSBRlovPyE9T2VwLrnMa+PVQI2hbf539dz9EFMRWS8P6bC22kqNsMg69W2Kr/HQ8nLsQAQbcTS/Frl5cq0waRdNDV20B2QQAQGbgp7OZ2Hs+RlCaQjcjsDstO6C8h9CjecUtQNhfQp3drDNIiXzItENb7Z1ta8o7ogQJJ0FtujsSjFCQy/ZAI0HVpFQ7fcps1pA9jrIlpZvhVBHGaMgh877JUCwIlipXPvw2PHL2WHhEqj87ktuvEwuN1kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7+RSZhNz8e3gJy6QxMr4STk12KQbbsSn07GRemjuLY=;
 b=JXkrO91sGw9hGlWKpcszJF8YpybAsV++a9CQO+rD8lpsQn2x2tKiFmJOTzwzu1J5glgvYytf1YkHewSbqnZeDRO8L88H6Ut1eRx82s0goSP2FBpcDf2oGEki4cgACoi5CIRbzZqKEBcqPhRqCuAJI59Us5AZhiY7+GRiuIdUq/lOs3sg8HD8FP5RK4VVDXEFVcDmDzH9mhMEsupH7qhLAL/26qqNGkDUTy93lXXj1r+vdPZQo3ZWxmgw07pAz/gIVPWtCaDnDr87+La/NvBqMqpxkyZADngoZwE6gwyjHHvt/NZjCKYpjCAvtv51/oP7rBb4xR+yszMn9ZzsqfCLPA==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from DB8PR04MB6859.eurprd04.prod.outlook.com (2603:10a6:10:119::14)
 by DB9PR04MB11694.eurprd04.prod.outlook.com (2603:10a6:10:60f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Sun, 24 May
 2026 14:54:48 +0000
Received: from DB8PR04MB6859.eurprd04.prod.outlook.com
 ([fe80::65f7:a733:64c6:60f9]) by DB8PR04MB6859.eurprd04.prod.outlook.com
 ([fe80::65f7:a733:64c6:60f9%5]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 14:54:48 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 24 May 2026 16:54:46 +0200
Subject: [PATCH v7 7/9] arm64: dts: lx2160a-clearfog-itx: move shared
 includes to dts
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-lx2160-pci-v7-7-09370c23b952@solid-run.com>
References: <20260524-lx2160-pci-v7-0-09370c23b952@solid-run.com>
In-Reply-To: <20260524-lx2160-pci-v7-0-09370c23b952@solid-run.com>
To: Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Yazan Shhady <yazan.shhady@solid-run.com>, 
 Jon Nettleton <jon@solid-run.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0355.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::8) To DB8PR04MB6859.eurprd04.prod.outlook.com
 (2603:10a6:10:119::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DB8PR04MB6859:EE_|DB9PR04MB11694:EE_|AM3PEPF00009B9C:EE_|AM9PR04MB8131:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e0b7387-8efc-44bd-1639-08deb9a46cd2
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 AfWD0J4kn9MJ+12OwbQ/tNrfimXz4VPK3MXCxIMdK+tdSHioVC7yYAWhW/wT9qr64OfQyPkpOBwAQtgRN33TL1ItZKLVI3aEpxf7KWeUEM5rI5GFlss2N0jtl5p5YKH7nZj8glcRXoeXNbjGd9ruzG7NMLI6A/NAMF/e9Q5kp44mGzS0yPyc9fDuZdo1IyOnJF7TSSgHJL0kG2f0NLWCNgy46vhuoZqx6tKI3h22EHDfwuW4nQXH+2036782Qm+8lzv/ZaJdAHrdjfTbqKTc4KUKsgvry6FWghBgpD/U3gd6vLeLl+XPvpFBkSsSJvf8mVOAULrK/8A59IZgsxUZVOtItRb8GZrm2SaRNRQcyDLJLWm1BQFr0EHHMDb4V5wORyvR9rdYPBN/SxD4aSCQeTIdBYmUOmqXJM+zahqsxlPp7ce/bRwstA1RioNGADB72AV2g89E0Lu9Q8kO2rU1haz3/Nvp3jDKYQy2L5xnhwWKc41XUVGBfOPp0R1vI2yH+bC1VjhtJpJG3MwilyghxIBzlUF4ROenvCd5/OBgbfC72sZolIO8uniTSzKlwhPXv9fV5lMnLa0EE/RPrzXfcynd9vM+ycynGY5Uk4rhVZ8xkraWszTRSzfvPcYoxPT5tDzGIhcb2i7V/pqUsiqUUOqaXLCuN2STTgaV1YnEeA37mK3e+mrsuRQzTi/9mvIOCKDIpEghQ112Cj36DnoazwFm3hYnoch/Tx4pKGhq87P+uQGoT1fP82a7rHRdcbc8Ap8ojbqt+vqnpE9cAIxt5w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6859.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 Jx2tREFe1bcb7QmIGAx9Ei9nQAiCxpV3ZeuTlQgj0058V1eCzTUAS+6MNGrGwEpfnxk0/YFqeW6PMTrmr4O+oGAWcuggnGK7iZMV8KJ05uAFmNsB6m7L6adRnYCvDcbE4qroE3ws93Ig6Nm/vG4G+vpMG3qm/1TvsxogtyWP+Ul3pYbGBG7sXmG2TQ7n5u2VM2h+sgZmAePH/8hcQefqNeTGZB7LevkfnH8SX1KVz3U9IQwsIYS+N5P+9FBWTbOqScJzfrPXObrzJw1srVyscPV+KkiIw+WEsOuTSqWF945C3cz4skdz9hfLv17Hog7nFMrYGx5d/8fo8pyr0NhROA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11694
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 87c09d86f7db48ba9265231a5d72d8df:solidrun,office365_emails,sent,inline:f0a80c7ae45db1e94016ae4aba1c5d31
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009B9C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b3f92088-86b6-498c-5632-08deb9a466ad
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|36860700016|82310400026|376014|7416014|35042699022|18002099003|22082099003|56012099003|921020;
X-Microsoft-Antispam-Message-Info:
	dqBY5x3bk7XWkR8uw/Wcyva+3zhRgbkDFEDJTtzOMGbV8v1rtShHF010fVGVQdU+Xnn/nLhi8cmPEBnVXM8ofELo+EnhElWYCSFdOZn1KA2ea0lJljEKVGTYLRWsXTI+NLaPNlfPoKg0U8BfKVw8KSQdixnmjGLUD7dlbM2nnWAbbVUtbMvEFnNRCq6u3+PwGaTAHBvfI+I8cxSg6USKdM2uP4ypq453I+aflpHYj0DEBijlR30TAV1uuZW3ifAPxLklIw1x56RtpvKBATe8mtAVmQWkudjdSo8gcWmbMmfnK5Ul34ooUFOYbULmF55GxF+i/vUx643JcdEuFOKnB02ivfMMRQiulbRgVYo2qU63FWVPbHjFiQP55B1/S7BKGvdnzdCi8TboVTkU3pIFFkk0Z0hN9ZRzALqM7tb3V7UXceBmNYJbG9aroV0F6NmRXEbnVkYqs0EXyMgIV26omqplmMecvLlTWChnj6JoGwYqsn/lOY5b2FcRM3ByYP7hZLJRUfXAgb1bE6JcaUlStcF3Hs/w6X+RwMNQTm+aTN+zYVVV1U8p25X1gfEVrRkRiEJ8T80EJY+Q4SZM1RMG1n+XU4BlDusCM+pIu2C+DEZ5s+2qWjjY7aiBZLQAXC5iGams11X8nTosFUMQ/rAlvC8uT0RR0DOX5f14q3BVx8r7dPRP5RkVTnAZkNLOPz1uNm6ae0MD++DdMltOwxZNqswZrvJidGn/t5x1EK69MQ/hmmBz5KDxFf7ZRcbJ3wElIL5i9PKWEYEtLaHjLNiogg==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(36860700016)(82310400026)(376014)(7416014)(35042699022)(18002099003)(22082099003)(56012099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Aa1wCLXjd8+/WI7p1pJoNOb5MwVTS/H6CDpH2yuyXw3upyXG4Bd+mthlePAYdXu1p9Tf6jDHeIoNzqd8DQoh2huxqw7S9YXC4HvC+qIbTb/KXlqX3ePNTFEXfuj2evnW2V3za8cyb7bcfQSOFwlr6ATf2GCYAveKS+Tq9bQWJX1WSAuBICTPUULddxJ/KmEg+fFiTBl5zPSuCKY1ywNHfzuvqrObshYuf6EReNmzOHOuLfA4TlnOhrBepzFkbfxO5Ac+XttwtCnSJUwgQCRF0crAojUVxfZv/MDKlzQbPBVGWw+cVNPH/d3Tyl97x1Erzcs44K+NoenzjaTZpwYCWmqVM0njqcxauKN5EvdQ37/lDJKN+aMsBZ5KVi7X7fw9VAXrwK1SJelhKCm+LD5fp4xz5+NbN196xqf5clUy7Xf8333l08PL/1bNEP907NqD
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 14:54:58.3871
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e0b7387-8efc-44bd-1639-08deb9a46cd2
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8131

Originally includes were defined hierarchically:
- CEX-7 Module includes SoC
- Clearfog-CX & Honeycomb common parts include CEX-7 Module
- Boards include common parts

This makes it difficult to modify the includes on a per-board level,
e.g. when adding a new board based on CEX-7 module but revision 2 SoC
(which now has its own soc dtsi).

Move includes of both SoC and CEX-7 module out of common parts and into
each board dts.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi         | 2 --
 arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts   | 2 ++
 arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi | 1 -
 arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dts     | 2 ++
 4 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
index 56b74837ddd48..7df93bb37d13c 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
@@ -4,8 +4,6 @@
 //
 // Copyright 2019 SolidRun Ltd.
 
-#include "fsl-lx2160a.dtsi"
-
 / {
 	model = "SolidRun LX2160A COM Express Type 7 module";
 	compatible = "solidrun,lx2160a-cex7", "fsl,lx2160a";
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts
index 86a9b771428dc..802d7611c6479 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts
@@ -6,6 +6,8 @@
 
 /dts-v1/;
 
+#include "fsl-lx2160a.dtsi"
+#include "fsl-lx2160a-cex7.dtsi"
 #include "fsl-lx2160a-clearfog-itx.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi
index 6388bd60ffdf5..170e5b0034f19 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi
@@ -5,7 +5,6 @@
 //
 // Copyright 2019 SolidRun Ltd.
 
-#include "fsl-lx2160a-cex7.dtsi"
 #include <dt-bindings/input/linux-event-codes.h>
 
 / {
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dts
index fe19f3009ea58..2b1e13053422b 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dts
@@ -6,6 +6,8 @@
 
 /dts-v1/;
 
+#include "fsl-lx2160a.dtsi"
+#include "fsl-lx2160a-cex7.dtsi"
 #include "fsl-lx2160a-clearfog-itx.dtsi"
 
 / {

-- 
2.51.0

