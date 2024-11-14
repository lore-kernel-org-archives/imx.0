Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F3516ABC6
	for <imx@lists.linux.dev>; Thu, 14 Nov 2024 16:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731600109; cv=none; b=CnVd/fxElK9QLwU7CuBIDGyVhkrRYxMpwTnBDYM+HOl7UXs/ac7RysLQNTu0gLadleCyK90TzlHDUSvByBsjUhepZ9bhiMM/4c8rZxWnSU69/bZGGhAk3MC1u8patLjo6kK6SO+BgSZPLiRaJi2Iu0PUFsAiDXAQWbFk+si6FqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731600109; c=relaxed/simple;
	bh=LLKUlHSRdQo0ASKheAI2lktC1qkTUKqGMf38rCFKTT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F+W0qimWpErlxhJz1FdSY32PtsgP4JRTnFTCxBJA7jwFU94SRTIkOmGaLYQ4axwRpVabk9k7fVerpqZjwB8i47fR9BQX5p7H8o42kdjmPZ6x0Q+7jhQWrvjjd8qtPbXtnh3MRbeZd3rj3WcvRdyoVQK5JZo95tAkz7fvt1lkaf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=IoSeTYtR; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="IoSeTYtR"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3821c5f6eb1so473862f8f.3
        for <imx@lists.linux.dev>; Thu, 14 Nov 2024 08:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1731600106; x=1732204906; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6sBEsvd+dgZ/xP6/kn7wo3kVN9KTyz4HVn9G9Q/OIqs=;
        b=IoSeTYtRn4Ii4rAcFOlKBY1DHVtB+kB2pnzEQ7AFiaK+GlGC7bccI5JXDNdYaRpBEA
         dYIojqg1hcmDTUCuEHBfbuy3j989GiBBQ+nkGEd7dtFjtaWpqRZBPYMRxxeOHtB0ibd4
         G3/0bERRUDUb2iyTriddfywcmQuABvCRS4CtaTwcOiZYuMyzUfqAnlLmTnycV22+s9gn
         mMY3xgtbOTj2IFOzblAQRNdH/6lD9kMr3+ioomQPQhEG2ro0GQtIzcswivalcZfQs39y
         QLqx2u1a2AdGYGa9QDjD1MexyZYHKBYThh3MUL0l0lkigdaS0ohPGL82OVMr+Fzthv2P
         QGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731600106; x=1732204906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6sBEsvd+dgZ/xP6/kn7wo3kVN9KTyz4HVn9G9Q/OIqs=;
        b=n88mMmG1XkoM9iEr/N3ccSWVyUSlLF4bkLleummtGzIFnKVZEDn6mclhEIWaulDQnQ
         WiPHxyEfR1kBt8s1IVzk6S4uPviOxhJ9s9PNQlySK7yanTHRH1Zif4SDROIbJDcGNNqs
         nrz00Gf6CQimfVaLtydnTFATkm828LGM9iarkO7Ob33j7qJgyqevWyTY3AxSZjGVmSRr
         cx6DytflrgJYCjZJGca3ruASut+CJscDd28h7nNIGfSr+71NoEe5v1UBkSEF88qsCqvW
         CJKstAs/ZGmcOJzxNPyI+Npk4panz3IzOrfTMg3/0z0Lr0XWaL3pUs1uPw2/HFw1yYu4
         MMig==
X-Forwarded-Encrypted: i=1; AJvYcCUZTVge9oxTVmjz5FUgyorkDpWQh6BQ6p9QWzCIxNwZ0OagUwKHsfXtmBTl4DkLNXn3f3M=@lists.linux.dev
X-Gm-Message-State: AOJu0YwXTrCfzcJZ0cAoGliXznjgAxGBI+jlHW4MFrU+S/gruxpkB3n0
	eSpqREVmuy6r6LiCimBNijL0G/x4V47rvu8oQVMDxt/WIB//PKfAnHZDvqfER3Y=
X-Google-Smtp-Source: AGHT+IG4Sy0eRFWGgQ022WtiTP8SuksgBmcBl+ihey6/w0qCP+GyJB1dxeBjLookfEv7e1llkV/zYw==
X-Received: by 2002:a05:6000:18a9:b0:37d:4ebe:164f with SMTP id ffacd0b85a97d-381f1883d96mr22287017f8f.46.1731600104522;
        Thu, 14 Nov 2024 08:01:44 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-382200fe00esm1139024f8f.42.2024.11.14.08.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 08:01:44 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 14 Nov 2024 16:01:14 +0000
Subject: [PATCH 2/3] media: dt-bindings: media: i2c: Add IMX462 to the
 IMX290 binding
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241114-media-imx290-imx462-v1-2-c538a2e24786@raspberrypi.com>
References: <20241114-media-imx290-imx462-v1-0-c538a2e24786@raspberrypi.com>
In-Reply-To: <20241114-media-imx290-imx462-v1-0-c538a2e24786@raspberrypi.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

IMX462 is the successor to IMX290, which is supportable by
the existing IMX290 driver via a new compatible string.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
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

