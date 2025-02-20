Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75027204878
	for <imx@lists.linux.dev>; Thu, 20 Feb 2025 14:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740061076; cv=none; b=l8MNasEewUeF9Ge91WlF3nCA17fb09rYVRg3VZqOjBn3QH5PhoSXXcZ4CDxUqrsVbXZCG8o5GS8fJqx71vGG58Gs6Y+5cRhLbRdSjEWeCgRXl1Sz4wbdLyLQAexDL+jJ1o4ZKfMXgTrpXf3krldVKcz7QjjkSB6lWWdP8RUnSd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740061076; c=relaxed/simple;
	bh=lg2S49Y/PXrPABJ4Pn2C18lsbCiXukENnnTBnuXF1lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rl1p2WxP6NC4UNNBIz+/fwJyDRn0kIustLmQnPgEo440ZkJHOEoV+N/5kthuPjJiTbZ9o/Qubxochv4N9BW225QLx9X1GP5nU3XXTYA9utUSll7UJSe+GkPHC+lvepFbDh3wpHOQk2F5pvWUDwLH4IvMafl/iiFZGBO237gNbqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CKq7e+ev; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CKq7e+ev"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e058ca6806so1702955a12.3
        for <imx@lists.linux.dev>; Thu, 20 Feb 2025 06:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740061073; x=1740665873; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrabmWDNnjDbFDGwlYLKTrhkDOrLGupRTNC+Vz/SZV8=;
        b=CKq7e+ev37/uf8EzehJV8YVDFIhCwwU+VOzGfETVB62SOPTqBgLG6VZ8R16jU31StA
         YBCkFYuhyjiQY6ZdA/8PlqV+PYWgXSouPEpVnNitFozS8HFEIS2t4ZX4r06MtCQY4zZt
         xCz5YlhSCEL1Tw8PLjQ9yx5dmNro6Gsiez89YtOZZMYpVBAVljyTqaKXeilRv8BLW8js
         QGSNWJT4YWXanwmltj8XoqgpU6xc+MAeM/Oyp1wE9pzNnZJLyoc3cr+EHnFDS3+yHzUA
         HRG0qbEKvrKBwolcQes7yrQc73zqHLelefhrt4WcIvFXcy5rek7SjFnT8itEeapIjXvl
         5Xgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740061073; x=1740665873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xrabmWDNnjDbFDGwlYLKTrhkDOrLGupRTNC+Vz/SZV8=;
        b=wj1qhNVzU1ZyZ8lYSPyPXUFQHUJy6ISHYCPnef+8lx7WZL3ZPK6ybgQohSet7QyBoU
         pE+ZoO07DWfbJp1JVcy8d6XQQaQKxYboltcT7XfG0WJXBDrjGDayxC5l1qB4WxZx+s9O
         1QtTkftXoLOUuWqU8d9EvrFPObnauLcv/lsgazfqs0B1OAwmvO30C7X7ffDjbGHOFHIA
         I0ILfm0+Hka8S3VIOWsSODuhEYfol0K1+WwCR5F/n6DQ1SfE9NueHsImt3n4qSCG/56C
         mIhB5y8lQSO+X3DljyCNaeb+kzqZWrxfthN4BZ6Jy1bvbwc2uUn7ePgXCBFpQ9kw1vma
         TiuA==
X-Forwarded-Encrypted: i=1; AJvYcCX2pZvMi+GnP5SgkkEMKf0RPjR02dF+xJQBjKXpMiUEfbBCNst5FTuACC0jWhkef2I29nU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3RObMADNNcV6RvYBEXy+d7QUKeKfoieOEEDUENfXyVK87u38J
	y9XT19XhBJcsAsNoNwxLEJBkNkFgNqeNgbYUDgUpJ3vXNVFr3m2PVh5z5g==
X-Gm-Gg: ASbGncsO3njg3r7MN4xA0AKISg48DS+kkHF0/fKcxU0VKnLnieEkwYOivJlJ7zIRANk
	4r6mpNCnsWFMdXyaYvFC49MKs4Wb5pVMvfZMHpWTnIez5SNmw0ahmy+OdYVL4NgZ/S3SNw/EusV
	oslTAKIiuPWjcMxdkc6KyKSRCJ2zcAxc1qiD02Qpbx99dsooVKLKrVmiC+WiCJ0NGqo7b8JdaXW
	i0YVgq9VCKuxMgQ26ifbfMCLehINjRlC3Jnd8FtIT73YYamLikrtGtl/vXH+4xphtaZ/RR3Z1Xb
	BarXneRZVyiR+8akDwFcBQYivnvo
X-Google-Smtp-Source: AGHT+IFJTXX+DBbct/Jp9j7V17SgXIyxDY15+dtpRb6rLc//WW+3bSD4xvTcn19KGL1thCMxcgoDSw==
X-Received: by 2002:a05:6402:268a:b0:5dc:7823:e7e4 with SMTP id 4fb4d7f45d1cf-5e0360b4cdcmr24048577a12.12.1740061072625;
        Thu, 20 Feb 2025 06:17:52 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4f59sm12124224a12.6.2025.02.20.06.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 06:17:52 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH 3/6] dt-bindings: media: imx219: add support for Virtual Channel IDs
Date: Thu, 20 Feb 2025 16:17:25 +0200
Message-ID: <20250220141739.228714-4-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220141739.228714-1-demonsingur@gmail.com>
References: <20250220141739.228714-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IMX219 supports configuring the Virtual Channel ID used for image and
embedded data streams.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 Documentation/devicetree/bindings/media/i2c/imx219.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/imx219.yaml b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
index 07d088cf66e0b..766b0e5fedb05 100644
--- a/Documentation/devicetree/bindings/media/i2c/imx219.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
@@ -66,6 +66,8 @@ properties:
 
           clock-noncontinuous: true
           link-frequencies: true
+          vc-ids:
+            maxItems: 1
 
         required:
           - link-frequencies
-- 
2.48.1

