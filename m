Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8721A0B06
	for <imx@lists.linux.dev>; Fri,  1 Nov 2024 13:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730469272; cv=none; b=jHwjc17uJjuQ0pDiOTwQVK6yMsihMvJTCYWPCJIv01+meb3UuJ8GsO+wuj6E6Z6gfhNcEav8VCJg5BXpkXXw/Fj++HrQe0Z+iZ0EFSSW3QiIZgFAzDk1YdksJtiI0vkanI+y/rYNoRna1HJA/aWyNZz9CQuStxsGN9Z+shlCIBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730469272; c=relaxed/simple;
	bh=g6ZUaDE76IaBaWI5i8b4MvkG/gJKjGtVosTE5T7M0k4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SYGHgbPzT3pgIWn8AIBlvswNHI+tufRKzQx6B4F1jKH6JiTeO9AnipMRXm8sXKPrp/vRTgGixWIxiYewlvzCdNL1kihCXS6UVt9nESSkHicFHryBV1PwRCy8eg5z5LBvUOfiBNucV2czk4Qpd3769z9QCOphE3sLUYU5B1Gsth0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i4x258MM; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i4x258MM"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-71e61b47c6cso1720534b3a.2
        for <imx@lists.linux.dev>; Fri, 01 Nov 2024 06:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730469270; x=1731074070; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZU7MAARj0sncxwFgqQLvOZGjw24c60A4QeqGtRoxeC4=;
        b=i4x258MMr/uJjQ3E0hU9/iPGscKoqQPAAzXPGrF57eTTrBtARn/VTcj8QYX37nU55d
         3evzkMpnFqG40HtxQf30G3/fQv/QKQuMpG62fRKuJQu4Yd82ys/Fk9aEG4l4DsrCfe87
         Rt8jBnMBG80hiqKCTrXOxbm0N25ubl8JChIQ6lgv96iTj0l8PQ53znXzAdVq01uTpt1u
         Pt1zz7xoWoZAFKYn2u0O3+GuL/cSIQtpC7sBnJ/1a5f9Gic/eF9wRsAHg6S2DUGMWhnw
         QRuNjGpJKyZNLDIBdSaemj+VdbE0+/u7vKzD+O4miDa1fgFn3o1Ruz8iKBDUpOBDHkC6
         OvrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730469270; x=1731074070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZU7MAARj0sncxwFgqQLvOZGjw24c60A4QeqGtRoxeC4=;
        b=W1ZQJfvK67Zk0ezD7+DGqLbvfh8pwo+zlchb6nT1uPwukRrzn3XnqxPUBH0MDmAdQ6
         th5auOaB9JDZmgFXJB1h26ILtxtnZkYyEwaJqcHQMvFgj1zZwIu+i77X5oi5cUOJ+4oM
         wcbTnNjFcVnzoHWytH+Jy6UDEZI+M96gPJiFVrkuQW8mGa4x4ETXxBGVDAFMFY088cLe
         SpaCvDgrLP0Zz35iaC/ns/h52Mw2a17yD9s5428Nr7jUVg8xJZ7ScnJq1AGlaYQ3biLe
         +MLmR4WuI6M+unutU4DStLUaP9o6yTsLV6SxGwqZbB6NYiZWgulHsrEaEnXu/9gbfJ3H
         GW+g==
X-Forwarded-Encrypted: i=1; AJvYcCVi2SZ9ejrkQ+OjOqkycyEw2/cz4uHOW+0/49CfYiePT7C+PBb7rLwx0M8z4XFNQUx8hRs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzCoGQDMGNUpQD9BJRvZHRAgMqjBwvyp0Of0IqQiIk1uGhlsSyl
	wO0QWnL9nmY2w8Mhih79B7AUVEDVhuZrdrIZXCX8eNr5baqIUFut
X-Google-Smtp-Source: AGHT+IFNvODyOXFIZrFt2e8iiDHQo2FUGoSfpLAmSpRo47uVpMec5MwoTYVpy0Ef1+U4+wcnRG9sbA==
X-Received: by 2002:a05:6a00:3e16:b0:720:2dbf:9f60 with SMTP id d2e1a72fcca58-72062fd6edfmr33829235b3a.16.1730469269993;
        Fri, 01 Nov 2024 06:54:29 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:f81d:d4e5:9f89:77f2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1eb3a7sm2656270b3a.81.2024.11.01.06.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 06:54:29 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: marex@denx.de,
	a.fatoum@pengutronix.de,
	andreas@kemnade.info,
	kernel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v4 2/3] dt-bindings: lcdif: Expand the imx6sl/imx6sll fallbacks
Date: Fri,  1 Nov 2024 10:54:05 -0300
Message-Id: <20241101135406.47836-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241101135406.47836-1-festevam@gmail.com>
References: <20241101135406.47836-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

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

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v3:
- None.

 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index ad0cca562463..72e509bc975b 100644
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

