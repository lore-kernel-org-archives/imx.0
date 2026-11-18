Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=116.203.77.234
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998293;
	b=BM5d/ama7mPELV6ARx6nanLpurw7U2HO4C8wb0Ul/3Qx4ZfRVRrrGfLKa/fxXNKXxZ1x
	 f1MJ9k8GwwLIiOK3tN6E9kMAwq0fcT6Mst5katttw7aa43UZscaeZ13ro0fNG8uLNy40m
	 klz6/fro6y3QS8AhFadN8wbDxfkSa/sPSC2buNlx48WWt+83mdVrFeP3qBGKM7UyjDn85
	 j7t/0qOuxEvnD76CMvN0Cz1yJxfBYAaxL34k/wLgQBB3Zt4xKhbj2q4J4YvdkyV7Z6b1c
	 6b9ZHsQj1wi4XnO0DBwLjFFYJgAook79H0tzklFPdvD6k0WWreYLeuQmWAi3LO+oHjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998293;
	h=DMARC-Filter:From:DKIM-Signature:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=er5BIVyflTBw/dl8O4AeKo3x5VZC2mUzFVF3Z90Ru84=;
	b=iHWO5cOPauKkVjvK/YhsBzkB0Gz1wfPAz0BAD7Kl1oZmTpM9CecbCFXEItbAgm+pxxII
	 iidZC1FHvP6uaWKeuRFmhK6epIGlk2C5Vkksy4JszzvAeXxsIpLYSKu9JFeY2vAf4cmsA
	 wGSBEInouhlVGMDc1WV61YfmJ/GVzA3A8pbVGqgz386/SH9dmVMpGxIp9c+319sIyn8IX
	 +cJKnEeh6vB7KH+4F979Hv3SCzIb8fWYF+QN/+psHuj4+yl/eVJFFJrn1QcqHUVBkn7ok
	 aIt//n2FdzRP/8D7wQAffvyMNehHIBRQCgVQU5+vka9qJuaGbwYl3OgbtC557QalfXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fris.de;
	spf=pass smtp.mailfrom=fris.de;
	dkim=pass header.d=fris.de header.i=@fris.de header.a=rsa-sha256 header.s=mail header.b=qJGpuRDi;
	arc=none smtp.remote-ip=116.203.77.234
Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517CD606A331
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 10:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 517CD606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.a=rsa-sha256 header.s=mail header.b=qJGpuRDi
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1794998283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=er5BIVyflTBw/dl8O4AeKo3x5VZC2mUzFVF3Z90Ru84=;
	b=qJGpuRDiX9gBeQC43GmnsepqhWIRwTMLXdljAbtb/sTB/OmHaCDIybyEUuOlbSUDYL+QIt
	cj8DVBRYlenutZ3D+Gca/5eonUuQO0OqhKr5mJMDTB6pK/BYGnLVzkPG6kPTSKeq0Iv8HV
	7zzgbuGcXb36S7ulq1qoFJbf6ygjqbg0rIoLr05ahxeuMdAjqAKFHNodsD5JPdgKyn+3HT
	ndnqiEdOMVtcyecFeCDSFumCLWiNIH2iifPP8yOIDcnca2SzA60NQDo5Z1fWws4zphhhkm
	tY2qEtpMMXMPSzJ5B9ca8RkYpdLaRRoN1lIcMv4hdJ62GSD5Md3SbsT/ksp2IQ==
Date: Wed, 18 Nov 2026 11:37:39 +0100
Subject: [PATCH net-next 1/4] dt-bindings: net: nxp,netc-blk-ctrl: add
 i.MX952 compatible
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-imx952-enetc-v1-1-25721440602e@kontron.de>
References: <20261118-imx952-enetc-v1-0-25721440602e@kontron.de>
In-Reply-To: <20261118-imx952-enetc-v1-0-25721440602e@kontron.de>
To: Claudiu Manoil <claudiu.manoil@nxp.com>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, Wei Fang <wei.fang@nxp.com>, 
 Clark Wang <xiaoning.wang@nxp.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>
Cc: imx@lists.linux.dev, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=895;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=vo/Z9PpckDQXfhXy+AKwhEFDXKaJuyt510ocLsCv/0I=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIetvA4fK8Y6fnYxFqrrrrj8RvrNHYd4WCackjqcJd59PE
 mIJq9DsKGVhEONikBVTZJHit3htaxbrI3+sOgpmDisTyBAGLk4BmMjkzYwM7RMUxWfOnrLonOHV
 9/pWjoZGbqfsv3SuC9ju8Gvfom9bUhj+mbDe9Sn9JNLa2v65LLt2PrOI/8KFexc67OcRtTvF/dO
 LAwA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The NETC on i.MX952 has the same IERB, PRB and NETCMIX register blocks
as on i.MX95, but a different set of ENETC instances and a different
NETCMIX link configuration. Add a dedicated compatible string for it.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 Documentation/devicetree/bindings/net/nxp,netc-blk-ctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/nxp,netc-blk-ctrl.yaml b/Documentation/devicetree/bindings/net/nxp,netc-blk-ctrl.yaml
index deea4fd73d767..c443fe0b4693f 100644
--- a/Documentation/devicetree/bindings/net/nxp,netc-blk-ctrl.yaml
+++ b/Documentation/devicetree/bindings/net/nxp,netc-blk-ctrl.yaml
@@ -23,6 +23,7 @@ properties:
     enum:
       - nxp,imx94-netc-blk-ctrl
       - nxp,imx95-netc-blk-ctrl
+      - nxp,imx952-netc-blk-ctrl
 
   reg:
     maxItems: 3

-- 
2.56.0

