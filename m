Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC0B1C1F36
	for <imx@lists.linux.dev>; Wed, 20 Nov 2024 19:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732130256; cv=none; b=M67zkkLuwqn2omVBtJfjQYF3jG3SuaUe+pva5R7PhV6hEGlRexjDL5JhnaaEYgBwT3dnnGPRn2ShBdD3UPlMyP8/HXoC1qKTX/7fpr9Ov/9LKIbohj+a80VbLq9KRMJQzBW5q+1WJdkc2CbBPZkq2ouEfB8mIVNtFhOi1VxK8Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732130256; c=relaxed/simple;
	bh=3tV6GkAKanIEYQ6ZIvJMVnikoHT1hIYNzp0NLUDHrFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZRkMi+bbG9HTJjOU7lWt3pysCAxEzmnU5wkzWCm1PnyswhteW9Z11MfPP/ApqFUnTM2KC1qNNKgilHTL3rwkzy6ieCS6+gQrR45DTiGLMXuR/mBJKk5Fx0DCDDiFy187TYCQ+eQaLe5pPSobWSkxKjty6ajHFKz2+E1NQ9rYqZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=lPPAaN5N; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="lPPAaN5N"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3823f1ed492so724437f8f.1
        for <imx@lists.linux.dev>; Wed, 20 Nov 2024 11:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732130252; x=1732735052; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tlfK6fVkxSaaorM3DUmPJkAs0WHL/MQZMzNEpDjn1Qs=;
        b=lPPAaN5NueEE8S8ovYHwI5kGhJQFUrUfVYkgtdovvJmYqM2OLfBS3xFZbPphmvWKcT
         ZGGMa1Emy0fb5KGk46bHBP3krJKsJShRxLjsMleeJpkBjroUOZVz5TJ8RvId4jzeYVOo
         +guQbMVaeSBlXiQIyuM9KbDMqcouNHSOxs6m5RYyZwZSS7KCErtOyTlaAw5uR0n0C/Nd
         DItdLVgSnsjzSeXC0F1nC8ltfpD/rc78unYCUqUyVIFDp6dG92rPX2++572bXyAieqJ0
         Dtfv+2TlchR0bF7dIUyt5gCust2U20Y6YWGyaly1l3vFwSP5K23zWCrXsiNsLTQE6qtG
         ZpeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732130252; x=1732735052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tlfK6fVkxSaaorM3DUmPJkAs0WHL/MQZMzNEpDjn1Qs=;
        b=lZ21TKGz/fRSjSf7SadbPM+p/HC3mUVhkagL9SqwQZxQDDRxMA9lxDLtOYqyAJNly9
         9Rl07Dp4TN2YcR7z354ls1atd2An3kn8vHUjFMBW9FS8OHWujRHm/t3edkQ1f0aWepWc
         BBsUgxZ8rH8ZuVoEzU4SEgDlRgWVrJz9YuzwToohnLZ/WwbPqtENQ+OzQWro2xc6xYHQ
         FJHPBewOCZokn0eS80gVhABJZUgdacCE5+j9XaFi+z90oJUmfaBe3S3j78HhNeLMmQ37
         rNHTPbFal9bP9yIufzuq58FTvQcbmfV1K+3AXnHoj1ypjN+skAilPcr0B/diPWsBmUwM
         uG3Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0S7jv9a8mqTnszxhFdxA1cF2v0pHLK56w0Y3DXLeMRa7yTgeczZdVrDKjAC1heoIg7kY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyJXqr3w6jaTJq67Oe7rign/jUwd+UPzxQ31bWAJBcMSw94/tv9
	Q6sI2JLrLklMKSDgsUVinp+Ifr/i4kOE7rX7WVUrr+YNmxWm36BCmUnCp92+m+Q=
X-Google-Smtp-Source: AGHT+IFsPHCFTeyLurJH5qyVLl3pNocdRdlqiQRb210XXiKhMPrIT/IgqWReShN+rBrzroBvgkskDg==
X-Received: by 2002:a05:6000:401f:b0:382:2386:ceaf with SMTP id ffacd0b85a97d-38259d26078mr527503f8f.27.1732130252463;
        Wed, 20 Nov 2024 11:17:32 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3825a2c5ef2sm172457f8f.53.2024.11.20.11.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 11:17:31 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 20 Nov 2024 19:17:05 +0000
Subject: [PATCH v2 3/4] media: dt-bindings: sony,imx290: Add IMX462 to the
 IMX290 binding
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241120-media-imx290-imx462-v2-3-7e562cf191d8@raspberrypi.com>
References: <20241120-media-imx290-imx462-v2-0-7e562cf191d8@raspberrypi.com>
In-Reply-To: <20241120-media-imx290-imx462-v2-0-7e562cf191d8@raspberrypi.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.1

IMX462 is the successor to IMX290, which is supportable by
the existing IMX290 driver via a new compatible string.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
index bf05ca48601a..fa69bd21c8da 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
@@ -33,6 +33,8 @@ properties:
           - sony,imx290lqr # Colour
           - sony,imx290llr # Monochrome
           - sony,imx327lqr # Colour
+          - sony,imx462lqr # Colour
+          - sony,imx462llr # Monochrome
       - const: sony,imx290
         deprecated: true
 

-- 
2.34.1

