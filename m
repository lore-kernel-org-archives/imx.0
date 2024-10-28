Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FD12AEE4
	for <imx@lists.linux.dev>; Mon, 28 Oct 2024 12:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730119530; cv=none; b=Z8/UWSYhNufehWYYAP9fq+l60iiRbvd07UnsfpcPdBjH6vDp3AabTD3FcESwEA4ZJhELPMyyyKTAio3ao+NI8tprV4joRSIODcs4KvMUC5pjjlHQZxrh3VEU+EXgkj27EBj8eMPB2lyKZSCOR5RlUxbn1UW0SJAXEs/MS6teRHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730119530; c=relaxed/simple;
	bh=x77nW9hz/w7BlV4hGHsR7upVRKm8m/wrasaYyHBOE6I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cPqj201+n4lsRv7vx02KWFac4A2kpK8q2APSBIybGg5CiqDpNZSuUxLGLe/62S/WjIygVtior1cVLT0XpMSCcWcQ+bIgkh+e1UNeogpLviKWBvyiZixRqzaL8XaTVwV38W+5Wj7Fn3ZQGVIM+67i8oAfcjbthyxLjrWgGjioA0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h0WcjbZH; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h0WcjbZH"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-72041ff06a0so2694486b3a.2
        for <imx@lists.linux.dev>; Mon, 28 Oct 2024 05:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730119527; x=1730724327; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b4+yraJweQxiypTwgt/zZDRzjUUkz2XRIrNoNkRuEaw=;
        b=h0WcjbZHpiudN4iEJEHEW1pkXOxc8wJ+2tlqjjqUdaVp4z60n0UnL+cHqWRLUsFJsg
         IpKD1gvb8NI5SQgh4fjLGF/TaZ2ReykdQiir6drge+7as+kojiRfwCXFZp/0TIHVplWl
         uAXRc1owsd4cUqczneCEbS6s/4HETM7x7/Z/zBM0OvVMOmcWSdgEWG9q1ZsRxGj1vBNc
         gdas3PIxtNhxiZGmodNsOLY0lWdafaYGD1oszAe+Yjo7ImIpsYc9+0QjxXhlmblZgg7C
         p7jyUf1SeDvRt/f5IiRVISm2SPPr/OISv/3wP11olXDr4ITfIovlfILR9pgWTX3Z+qUV
         X1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730119527; x=1730724327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b4+yraJweQxiypTwgt/zZDRzjUUkz2XRIrNoNkRuEaw=;
        b=oaUIcegQTbATkCAPvUuka2Ps7Eo1GjpsJQYFxInZ65HDGblyjH52g4VdPPAiZ/nO13
         OGpG1H/fLpext/Hp+AM8Od72a4LJMZsM7zKtMxycjiHatDL/jW4Yn75Pwtq996wur8Ky
         SCvNSvXxmIym6bZ5DbhgtyU0yZ2YxUKoZ6fFihz5zxDnDW7baApULjs2m1XR8ShuVyrq
         omXu7IBhGCzJy917f6deiLytNc8e00iPpnl6V9tdVG51Q3FeqH2wc11qAO9w8dpsTtJo
         JSoq1aIkLAhf3HMK3jhF4HZHFn9E7nnv35UvFHgoO4j85Y68hMH9BASSY0vMwH+5g/U4
         2NBg==
X-Forwarded-Encrypted: i=1; AJvYcCUffsQRtL8khzDRzi2lJNVu1/tLtBfTXC+2RZG7hO4PObx7UU1cmgFNA1AQLyAhWsTGxZY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxm/lGPz3a1E/Jqaei6S8ie2Ou9qTMCr/2bXW73Fz1ppf1Jm2ee
	uTlxOjuHWGZVYx0l4g3LPfBNSG7G3zKDbPeucvgb9/lhc+nTo2Qc
X-Google-Smtp-Source: AGHT+IG4sdSjIEoJgKuJMhieAf+RDBF2IIEmvJ3Njvg+7TW5xtuV5KFh2xBO8zd/zHrDDA/Wwztq+A==
X-Received: by 2002:a05:6a00:9a4:b0:71e:19a:c48b with SMTP id d2e1a72fcca58-7206303657dmr12667155b3a.22.1730119526671;
        Mon, 28 Oct 2024 05:45:26 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:325c:8d87:ee5c:f04e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a1fe5fsm5638823b3a.160.2024.10.28.05.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 05:45:26 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] dt-bindings: power: fsl,imx-gpc: Document fsl,imx6sll-gpc
Date: Mon, 28 Oct 2024 09:45:18 -0300
Message-Id: <20241028124518.72576-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Document the existing fsl,imx6sll-gpc compatible used with fsl,imx6q-gpc
fallback.

This fixes the following dt-schema warning:

['fsl,imx6sll-gpc', 'fsl,imx6q-gpc'] is too long

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 Documentation/devicetree/bindings/power/fsl,imx-gpc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/fsl,imx-gpc.yaml b/Documentation/devicetree/bindings/power/fsl,imx-gpc.yaml
index c21a66422d4f..9de3fe73c1eb 100644
--- a/Documentation/devicetree/bindings/power/fsl,imx-gpc.yaml
+++ b/Documentation/devicetree/bindings/power/fsl,imx-gpc.yaml
@@ -30,6 +30,7 @@ properties:
           - enum:
               - fsl,imx6qp-gpc
               - fsl,imx6sl-gpc
+              - fsl,imx6sll-gpc
               - fsl,imx6sx-gpc
               - fsl,imx6ul-gpc
           - const: fsl,imx6q-gpc
-- 
2.34.1

