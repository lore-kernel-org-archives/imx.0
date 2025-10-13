Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E68F2D47EB
	for <imx@lists.linux.dev>; Mon, 13 Oct 2025 20:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760388744; cv=none; b=S3KX16HFd10aUCmWpTaff5EXYAMSx+FUIxnY92n/wStruavg0Z5vvOrNkfZ/0pLOn1vvMOQYjwMiO98BeAsUOtG2mjVFOTP+Kwy7V0mTDlAdXnJymNbx7167d/v7ZZMwKCCpaXMlFro8zKzDRViztrXSpCKAhEpNLBcAjkw2bpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760388744; c=relaxed/simple;
	bh=HJR6kFLQIcyLLWF/k1W5q8ysbhxqx4QOoIJT9GpKoF4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d09SA+l07ii/PbDqSA0W3KAT3EZK9ZP54CY1YU6apxvcL2JczlcTCN2n1E2WI2VmjUieePfp+so+7SWVAa6AiOKsOSfuNBgzbvtkU1pdyOOPUSz2WaewB4dlw52uqJR97Ub2aqkLIMqNboolTi2/U2P51xcXcYt4vU2y7w974lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mGuYMe88; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mGuYMe88"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-339c9bf3492so5966933a91.2
        for <imx@lists.linux.dev>; Mon, 13 Oct 2025 13:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760388740; x=1760993540; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxZ/iMk0sFlFcogYti23NV41Ls4gRV33Q62yrcsixBo=;
        b=mGuYMe88iTbAWFQDSPnwcHQcgHUqW8UVTt+IwsqjXNlhoB9l3d+OjsnTNxiE5GDfps
         g7AVU/qKNBt8N09uiKYfTZtJhEKjq8ziexeBBA2byezKt3+wvCC9sRxWU8t3p9PGiGSp
         w1upKhIMKWteFRByniZa/f+6wS4EGw1X17S+p8bWcXMTbag2AWUoOFBkY6OjQk+v+uIc
         wlzNjHVzr8VEVYFeBfM0UyvlpR0s31AVRs3RAAsfgKLx8ytme1d3RKoq/x7IQHb25uvN
         IU62UW9erx3trsozDlnR9W1ClDL48N8iY1kliaCj8AL0DLodKpiOjKyXy6Nqrir0JbWJ
         kiQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760388740; x=1760993540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LxZ/iMk0sFlFcogYti23NV41Ls4gRV33Q62yrcsixBo=;
        b=XY4b+yi9M9Mmjo6bG3Prga20MeqiaHNC0llzHBcCKUIVOHHoD91c4blEHF58R7lk1q
         AXKBmc87vZM4cfcOHt3TytOklX5wlUO5Pd2wLrIgFD/8AfLK1RUBh/MJfMggnGVQGwC6
         J0c395j7k6wRWalT8x4w3wL2p8WJNfAfdjSaOUtkSU/o5P7WLBWRBSh3vbVA4K5aCw7u
         ddDrLY7MVjfKA2h5dHSIFY9BthdtOkIR0nYHxufcz2rhN7w05E9iVdkbV6UO3f5VntVH
         4nhLPaNamaGzsJb8ZnIv5eerSgagYb15raHSHVzTSiEGMSPHKkumAzHMmPkFnxOJuD0N
         Uv4g==
X-Forwarded-Encrypted: i=1; AJvYcCXOECSrjKpBYbTigFezhPhmA8Izu1/ID/p4rjFPMh+v9yw/mQtbyGRvvkFcu+ShcsQiMAs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyspqk6qMs9NJEOR7pi3Kr1UNu9RTN4dtbdDrdn7KxM6RV1+fs2
	zQaP3+fNyGT/dMOyZBFHRcWFXhSfpSsAC2JO34xpzP1SiDjc0pSQ1+JR
X-Gm-Gg: ASbGncvmt5Amdfuf6ggnbLe0CE1MQLGaPF/9NOg7WUpwDla7AiOfXLsfgalylDJE5pa
	1FTe0w51KhLLU3dh1v7C0SxxWA+u3xagTyVnzousW9+Xj9tP1ypc7OcGexY2vYiWc+ZcGCdG6/V
	Akgq6DViHb4bAxrhI8XthrJABLsSNbanY8m8zsalKovRHqL7JahzHjKkHwW461YskbfG9R9jEhp
	AykAPCsBB9nI6TJdwPZUvHs6HLf+uBLd2nWKGmM2YlzVfudtglMq+AsGiKBnt5xVTUBdEUO8Wsr
	d/06C6s8Fp115jSfhRbGpiMdlMjS3pBRF+yw1yheTRf8QsTWliSVy+r7/g8WFm7sF8yC8VFC2Oc
	dvhcD8irRJQ5H55JfJs0+oXAeJxZ0Wt1rTr5SXhLskaGwW8HBUyEo0Uk=
X-Google-Smtp-Source: AGHT+IGoPwwLuuZSmqvJkvje9JpdAVuLDDPRbWWI2juN47Cw6JrjLQfw15al6qeoEvpbB9EAopUh4w==
X-Received: by 2002:a17:90b:4ac7:b0:32e:e150:8937 with SMTP id 98e67ed59e1d1-33b510f8f23mr35543703a91.6.1760388740438;
        Mon, 13 Oct 2025 13:52:20 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:cc82:37a1:ecfc:e51c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61acc413sm13445147a91.20.2025.10.13.13.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 13:52:20 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: victor.liu@nxp.com
Cc: marex@denx.de,
	stefan@agner.ch,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	shawnguo@kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH RESEND v4 2/3] dt-bindings: lcdif: Expand the imx6sl/imx6sll fallbacks
Date: Mon, 13 Oct 2025 17:51:54 -0300
Message-Id: <20251013205155.1187947-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251013205155.1187947-1-festevam@gmail.com>
References: <20251013205155.1187947-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mx6sl.dtsi and imx6sll.dtsi have the following lcdif entries:

compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";

This causes dt-schema warnings as the current binding only
allow 'fsl,imx6sx-lcdif' as fallback.

['fsl,imx6sl-lcdif', 'fsl,imx28-lcdif'] is too long
['fsl,imx6sll-lcdif', 'fsl,imx28-lcdif'] is too long

The imx6sx-lcdif programming model has more advanced features, such
as overlay plane and the CRC32 support than the imx28-lcdif IP.

Expand the imx6sl/imx6sll lcdif fallbacks to accept a less specific
fsl,imx28-lcdif fallback:

compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";

This helps keeping DT compatibility as well as using the more advanced
lcdif features found on imx6sl and imx6sll.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index ce31b873fb95..d665f3241e97 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -23,14 +23,18 @@ properties:
           - fsl,imx93-lcdif
       - items:
           - enum:
-              - fsl,imx6sl-lcdif
-              - fsl,imx6sll-lcdif
               - fsl,imx6ul-lcdif
               - fsl,imx7d-lcdif
               - fsl,imx8mm-lcdif
               - fsl,imx8mn-lcdif
               - fsl,imx8mq-lcdif
           - const: fsl,imx6sx-lcdif
+      - items:
+          - enum:
+              - fsl,imx6sl-lcdif
+              - fsl,imx6sll-lcdif
+          - const: fsl,imx6sx-lcdif
+          - const: fsl,imx28-lcdif
       - items:
           - enum:
               - fsl,imx6sx-lcdif
-- 
2.34.1

