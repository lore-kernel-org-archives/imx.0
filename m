Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038FD5650ED
	for <imx@lists.linux.dev>; Wed,  9 Sep 2026 15:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968456; cv=none; b=E9D5IxB4pN+t4BnKkBZfTlPX4svI7aiXZvlL2st3ytwX9xKN9r67TamP1MLxr/TspaJWH9NqnacIOYQHA9I4y2CMPA2jGwz9VkgqvyFGbax6429jHa4dsDE8T8xC/I1e6kGKb/YQIKD7o1+iAxZ8/1wzm0haH8oRpLU8Xn9g9FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968456; c=relaxed/simple;
	bh=2tYt6Xz3Ww2Nu03hw+VbVfk++p/qUxznZgUfL+6yi/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JAQNK6Btkf4ZzdMyGAclvUtFjWRe90n7hQrCWPqALG/+q1dbyaYv1AnQRbLIQVCQhTZ0GAH9OngubCU9pYWKfcPcwr30T4jj5MfVM0QNweV7xmcDYfec1FwMJwTSiX679L4toFu/Tl3Vb1DkECE6F2lM21lqWix1m5842/5QwfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PFAI3w56; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PFAI3w56"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-482dd6ee390so6647813f8f.3
        for <imx@lists.linux.dev>; Wed, 09 Sep 2026 08:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788968453; x=1789573253; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZIkGfv940lwcDRBFVlKYwWw1ZND7s87QEgBkPEkik3A=;
        b=PFAI3w560uZMBBCagOI6IEPuUscdXm3Z3gZApKjspXbWahSRMUGDK4MKzzZxuXWAAD
         mA2YPSoBHV3Y52G1SkcjI1rkse+IXPRLKNdgoHDuv+rpuUDvEi/hR4KDaHMMXIutPULn
         +g2S1nkegrYRKu/lngNSxYo7+s3MnczrzDjXYYQEmMh1dU0dPCiPDeK4pdiMV6wdG3hu
         0DJcvFl2J5BQlsU4Zt0zLBU8HVERzp6oy2akbjnKEdkYUR3WDZ1iOas1i1PySJRlzcwq
         bli0Gt0wiwVmOLeGKXoIHG2FBX0RIB8g5aVNNxuPWdzPRRa4GDgwHvZBmaTvAthTbKaT
         Siog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788968453; x=1789573253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZIkGfv940lwcDRBFVlKYwWw1ZND7s87QEgBkPEkik3A=;
        b=FLt3rrMJ7jGkHfUSsH3VnKMIqxxIOOKOtxYNfOD3y6cSe8NjWTKbl6B0eTVJnz12qM
         2vk/NhbQZumARIS99DbOHWOd6f/rpWkFpoJhNttR9I09H1vfMggpUDMbPkBC++CDNSfw
         Sb8UveXEHbOBHGkySumjB8aQgt4qt5NhXAJZ16QkMG/WfuZNHG7BjP9DE6W/8R1eZWsE
         X+E9BygtMSDKXqKVx4eyIMZTdeDOYN95IODBf7C8RHbJ9tsVq5W5ZXTNa9QxJZSrYP1Q
         PlVrsT9R2IzVfkoLPrrMZh38b9+HC6IzupkegY+rxRakoW/K0NkeR6fKmJAuPsOIvNYJ
         y6Ow==
X-Forwarded-Encrypted: i=1; AKwUvBwk9Jod/lxDTpQdNezpAgehtWeaBLgc7j8+P1GLUU1LN/4fM+XIyzA8AEZb60+UZTcUYow=@lists.linux.dev
X-Gm-Message-State: AFuF++mxpszHyidkYE1PsIIHZlZGthENeWHwfIb5E3uxWt0cyhmGB3rL
	J6uD3f/g5h60JNPGBSPxbCWQ1EyQggMUxlAcHAl7nXYItRxgAPsTugEr
X-Gm-Gg: AYBFou1LDvh0IpR01Jq5Ti+KjSeLYXVv48i8MwqONsqSyiPtHtxYuQS5sA6LkaUF7ND
	sqw5uwOOYRoY0n4KfGrE73Oc95+JVMguzmOmdy1xgg2cgBHBw5fIJFd89jIjEplvuzVRUuhzSHc
	QgnVkyRmnDWjSkFaDP1kr8X1OsaEpT6/1zw1B2E3glLUKp0R0fqjo8I3gQVYvlESlnsUFok52sh
	694sJFDqI0v+CEa2Bbni4J2M4UZAygd+RQz1VppO2uabyL5P1rkcaKZpU37z+25g3DOmgYFnsTW
	Foxjk20TTUMtIWFIMkLnj/zEdd82cSss4WW1+w3PUA29lSNZ48Xi5SuLhSMkhi0MZ6W0JpICIWJ
	K98tncmv99woax8gsjngOaDyLaXhIpM0WOxx67wHDvLP9HGSZ/iHew+LqwVJnoPhrBXiKXc8Lof
	IxSm24GhvrJvClEd5Rb/K4GrRgN6ppl4tKtf7Gccy+iaCNKhaqAV7UaHTO+wsXQaZ0H3cxLjpEU
	HLA/cWbH13sM6TKWeNvT3ON3g==
X-Received: by 2002:a5d:588d:0:b0:485:8c16:a338 with SMTP id ffacd0b85a97d-4858c16a615mr33895800f8f.45.1788968453181;
        Wed, 09 Sep 2026 08:40:53 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885be1c1sm43810943f8f.32.2026.09.09.08.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 08:40:52 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	elena.popa@nxp.com,
	consmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 1/2] dt-bindings: arm: fsl: add MR-NAVQ95 board
Date: Wed,  9 Sep 2026 08:39:42 -0700
Message-ID: <20260909153943.1048-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909153943.1048-1-laurentiumihalcea111@gmail.com>
References: <20260909153943.1048-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DT compatible string for the MR-NAVQ95 board.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 338dd9eafb17..c91ae3ab7cd1 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1536,6 +1536,7 @@ properties:
               - fsl,imx95-15x15-frdm      # i.MX95 15x15 FRDM Board
               - fsl,imx95-19x19-evk       # i.MX95 19x19 EVK Board
               - fsl,imx95-19x19-frdm-pro  # i.MX95 19x19 FRDM PRO Board
+              - fsl,imx95-navq            # MR-NAVQ95 board
               - toradex,verdin-imx95-19x19-evk  # i.MX95 Verdin Evaluation Kit (EVK)
           - const: fsl,imx95
 
-- 
2.53.0

