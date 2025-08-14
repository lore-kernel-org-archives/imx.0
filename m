Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A94D303CB7
	for <imx@lists.linux.dev>; Thu, 14 Aug 2025 16:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755187640; cv=none; b=gRq2qbbXI667xIzOyXE9oZuESNbe39mgEvHW63LXEHMETHEQd+mZKEOLxDLt5jjJxEXz995lvTvl20Z66Fy1U9A5Cd/U2vAVt5v4dYva4/Pnotw0tW3dPaf/PsXrL/UAsQsL92QUeqBcAO1Y0ASIS2OTZtzEPs9qKydq3Ghzv4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755187640; c=relaxed/simple;
	bh=1ZN/hBU5KFnWEm5a5v90vlczlCZ4mmlahGdTTa+btSo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M1p6+NbxXHsrseQb9tDdSs81CtThpt94h0fnr5+xFH7qvVTKYthfaZkvrDzi3WhOC24B6omNO2htmTLgRVuDPsu39W4odPxbvrfvGHjcPbGzBxmZ9bRGfHgEsRmz2vKWzecXGCMlpGiD+L5FSylX6Na/fxxoeSA26/+09ammncw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RNV12lU4; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RNV12lU4"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45a1b0b2d21so5674475e9.2
        for <imx@lists.linux.dev>; Thu, 14 Aug 2025 09:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755187637; x=1755792437; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6w8t1k0+L73Z3H7zGEQgr6I4vcHFOJ0Mhc+O6mOnc/w=;
        b=RNV12lU45kkyztQgIZ5HtUdzWd9NnpQiMge/8O9XXu2U5OfJ1L4NQizmYsMPcUaiUx
         Oi6lX/mWrch1SAhVTlWkOIdjwGcoRoyE0wq+fS9GlF5ahTHM7M/2aNNrlRpZ5eHEW/5j
         RqFWaO5iJsd/fGBddJyjrvFM/dhr6/se1fz7Fnr8V42i1pW53rvKcCzTG6jm37pjneQ4
         ajWhSZA/MU2GHpirtrObcYe4pKgDDzrSMObA3Ww96sG23mhnIISPVMNwpachJepWtFg3
         ZO3aOxxB4NLu15C+aVjfmXIOFSEKIAnVw+BzbEx8ds1iFOcsYCY9w+UNgug5hd5Xlq/J
         O8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755187637; x=1755792437;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6w8t1k0+L73Z3H7zGEQgr6I4vcHFOJ0Mhc+O6mOnc/w=;
        b=jhdSCVpg/hT6D7wkZ7yt/lCiy/k60igBaDu0FT1H/9XFGslY4G2CI4Cz6uecCu7si0
         VahvQ7MI6ASxGyRT7ePDij7TUzn7di5sr2WXa569IltDCXwOISXAGclCOxag0EG54twA
         UMR6EbkRNEoUnv+v6VOeUe0cHgSfAXky1fUJDonmzaVRMM3qQu/xBDiMTVKOGd30las/
         tsbYogYU2wZeWhDoffW07nuo3Ci9cm67df/kdBev6ULaYUtfVTEPlOphMG6aqRWgGiJn
         2A4Ro5RBtE3/3EmneMnqTqz34wZvpCmuHuGKbYBjA6xrNFJEPlEPMQLJS2n9lMJ6ExUJ
         yrhA==
X-Forwarded-Encrypted: i=1; AJvYcCXrg4m3RU7+lfkVADGiCCfsfAqBRdIOVEijftrkwNY/KuMzyYC/kdYwbnVVSCZrl5DgSRY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4doMgIY7tk7QUMt5t33sxudLsj0Cxe6R2EU6+eojvzSlVmudM
	0BWHYmOE6N50mwupG1/X+D5eJSra36qGkj2YdopMKiRvQ9y52w9XrSg9Ixucc3PN234=
X-Gm-Gg: ASbGncsNCsWPrO0BZZcqkibh8KJuJ/pTJL1/nkx2W2wS/CvsQYCYbg+cZeBzbLC7EgT
	ecTdgPubY6IxFrOBjAcxCqOejpl/J9E0YzXOfbwohECMx5YgxDhdejOgq5BUnqGYAWXF53iBJVV
	9f6u3PScUNcfLbOWIeZS7BPbWWujTKDen064lovNIO4eQrU33yPU+IBIkO091efLDenT4EG4wRk
	cqlQOHu6pBzH4iJ43VGKgL/70sPe8C/LGzlPHHgr0ZZFuC4TkzAu4Lq9D39dj0tRzNwzKG9zPUI
	hlobxnPCGyIjyiQHA/W20Dp2TavqiQ+iZUpBFZ4g0+mXIgKLcasq2RmZ9jMo4q9n2qdJ159C5GK
	xDhs1WmsN3yZ3IKM12QjlWFt2KYPnFtk=
X-Google-Smtp-Source: AGHT+IEZbpliyIDsPb6R0FpfpFlg3UBRXfnKDNpZBswiqyG30cWnXAPOznL3hegH/Ef1DZOEk8/F0Q==
X-Received: by 2002:a05:600c:45d0:b0:440:6a79:6df0 with SMTP id 5b1f17b1804b1-45a1b644c34mr26991495e9.22.1755187636941;
        Thu, 14 Aug 2025 09:07:16 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6bd172sm28363495e9.6.2025.08.14.09.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 09:07:16 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 Aug 2025 17:06:53 +0100
Subject: [PATCH 13/13] dt-bindings: lpspi: Document support for S32G
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-james-nxp-lpspi-v1-13-9586d7815d14@linaro.org>
References: <20250814-james-nxp-lpspi-v1-0-9586d7815d14@linaro.org>
In-Reply-To: <20250814-james-nxp-lpspi-v1-0-9586d7815d14@linaro.org>
To: Frank Li <Frank.Li@nxp.com>, Mark Brown <broonie@kernel.org>, 
 Clark Wang <xiaoning.wang@nxp.com>, Fugang Duan <B38611@freescale.com>, 
 Gao Pan <pandy.gao@nxp.com>, Fugang Duan <fugang.duan@nxp.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
 Larisa Grigore <larisa.grigore@oss.nxp.com>, 
 Larisa Grigore <larisa.grigore@nxp.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, 
 Ciprianmarian Costea <ciprianmarian.costea@nxp.com>, s32@nxp.com
Cc: James Clark <james.clark@linaro.org>, linux-spi@vger.kernel.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.0

From: Larisa Grigore <larisa.grigore@nxp.com>

S32G2 and S32G3 are currently treated the same way in the driver, so
require that S32G3 is always paired with the S32G2 compatible string
until there is divergence in the future.

Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml b/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml
index 3f8833911807..9fc98b0f3428 100644
--- a/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml
@@ -20,6 +20,7 @@ properties:
       - enum:
           - fsl,imx7ulp-spi
           - fsl,imx8qxp-spi
+          - nxp,s32g2-lpspi
       - items:
           - enum:
               - fsl,imx8ulp-spi
@@ -27,6 +28,10 @@ properties:
               - fsl,imx94-spi
               - fsl,imx95-spi
           - const: fsl,imx7ulp-spi
+      - items:
+          - const: nxp,s32g3-lpspi
+          - const: nxp,s32g2-lpspi
+
   reg:
     maxItems: 1
 

-- 
2.34.1

