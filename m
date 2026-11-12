Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494293;
	b=qBHzo2KzI3LeJAPxxJi6YtVZD4LY7rUw2M+SBSUktMHFjUoQkghlOsNn6W775xDkMV61
	 Q5/j7MNSARmDeENG5Iwp529tVvqiqggUNrYetP5IWv9TE1LTDnhPbpEz9WVUvo4jKaV52
	 yXOiLvOxvAwxKhLpGRjumLORZptLrCgPzrQ7cGLePJBd/2JYw1a1ani79JbRJ0BxSae4M
	 tB+fneneLgbuTQ0GY6aRAhYDfXGOKJx1QwazoREnMVCIV11v8tHgziWO4dBW9sTfI6bzE
	 Jun0MTGbDMnRfHM6/0r63sgPlyy7qo3fI+q+xucdTwP9jdaZiKSf376p1L9ogBAQ/FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=wXDiU+g+Gn2HmoB14YGhZhK55PgFVMpz3YYljR0nTHk=;
	b=u0vALjjJYejWl9bIDKe4SHu6gAuugZnWddBvX+hQMekhGCKmqhr1RIBtA9U23MkC94VV
	 hmV9zCs02Lifi0WJ1EiMlmaWP/7IRgJnbG57jQj+DClzxE4cvjLVubf3vT2gsxJ+mNrR+
	 O0iL4eSYpGb0uZjOL3rfO9DdLGM7oHW17WuGFkjtXMfmBw753ziphx/kP4R7caG3GHsHM
	 CBfqMFQn4xNTF8baD5cvKDgDQInBF/zmIOvK0gPTlmb0nPrU15T72zs2OG2HOQylNBIbo
	 Z4Vr7oMDdC17Ta+fWsCuV0ev3IZPFpa3qXS98CdEJSONCrnk5mfIWohVHePWX7Dylnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IX90Pd0s;
	arc=none smtp.remote-ip=209.85.222.43
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED592606A88D
	for <imx@lists.linux.dev>; Thu, 12 Nov 2026 14:38:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED592606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IX90Pd0s
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-998569550adso2434159241.2
        for <imx@lists.linux.dev>; Thu, 12 Nov 2026 06:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794494292; x=1795099092; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wXDiU+g+Gn2HmoB14YGhZhK55PgFVMpz3YYljR0nTHk=;
        b=IX90Pd0sdQ0u9pzVK84YzAQ7EWbwv8mbhUoNm9eNhI9uDoE/7VbpoSKkw6/tVeaVEd
         Vs28qmY3NOIAHMYhUbdNR7ZXE0IJVldIqalq0VzuFadbOwnrZ0CXzKUw7dEwLyyiD/SM
         7oAqEwK7pY0uc5SHXLoKTnzibLJ192dfKi0hJ2VErPZ4aETKyQSWaJmpZAX+A2sx8a46
         rMRB/LjrwXkkWDn78GBsoslvHHhMqz6hjxm1Z26oqOmneTv2DmedHhS9ySOGTPQV0dCw
         r8fIs81lJLLigJwdiX3FS/GU28Gp4dexuJ5vAi9j5UtcIBOLtmDREs17Wai4OX+30If/
         H4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794494292; x=1795099092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wXDiU+g+Gn2HmoB14YGhZhK55PgFVMpz3YYljR0nTHk=;
        b=pb9fPhaLXZpr9x1oIhksjoOmoErR3/hiCM4Uej/5vvvSo/CyeyrTfGkurEewaRdyU+
         JC1OGYeWF1I3m/QMA2dLn2EXlTYyhy/tD889yY0T0E+Fu0DAJwGnBxAKp7D+TkPkBpAV
         uz8TWi+LTCrqeE2kYv28sDh51weQP4DsL2GpQsLb7eatZR9TZQQLEu5nuTeiF2WRwGSX
         JjbHXJWyPhB0vI0zgq+i5L2WRnDvxzfaHF1TdCO09JyYXIgbyCwRto7f8vdnFTDeGMVn
         lwFBNioaijZyEnmGvORh0uAFxgvIhHvEmMaxFG/wVwC9+fJ3XW0u10jRuFLnscv+6sIA
         ngHQ==
X-Forwarded-Encrypted: i=1; AL+hErFAVvzg1LeWyqTD0c2aYWBsRAvTlCF+hbh3MJWCYwJXAaeMcG9adfRv3Kup045/AK+3Rts=@lists.linux.dev
X-Gm-Message-State: APuU4Z+Bn36sr+s+G4dV7zzb+rzKq4+XGsS4cGA4fnoXTcC9ZwU8WxGV
	Ix6NqKS/nf9Sr8ObnrYOH5qXXQOwxE/WkUb83F4HBPnyQYj6kIMhW3A8
X-Gm-Gg: AYBFou3EIsjMRfaFh513SfG++8knt4HBDkEuJHvxkuKyoMNvA6lp/xXnysAzXkwLZfv
	N6mmTP3yjDrbUHdunmMOlu3ZrrrD6YT4l2mVEdaf+/Fc3QcmKBh4ZywIjCvRY6Ld0ZUQoac5Wca
	kIEMKee04gBRBxzqQPxjb7Uj3LitB1fRvl8+W7DElRgPOEVZ58fr/YKmr1h1AAZ2eW3ObyV1mKn
	/zeUMH6iIQUZ8inLPe55QpSiJ0kU8/axzH+RcYhuJWzqSomgMWZc1Xisv+1zeIM58t+qMIBOhft
	Q1NeBAtFnZGa+Z03nH/mHm96tDA9pflfeH8aeTMYgiwAUcwJlUbMZlmt6pGSro82s4XZQehs9Qn
	f7OZSimmPRU994QaDButn/xGbcaDzbk3MukxOQ2GpdSDiGhQspdNc5RObNiiC+DnWFdQ2u3CNAh
	GdKjW6+BoGJripx1SVBQXSVIg7EHxdNQOQyA9AnMG9kPCtpY6BUjCSTfB08wrGmD1MiQvX9F6wV
	pjZBEyyRcqtPMJDYfZuAYAAS4wFII4wukTDelrz3Oh28zTD+kw1GiMa0ES+ClGAdF8OBn/4vcU9
	Bf0L7IGtphn7GNvL2MSpDTwGXZWOU/neyMi6RMhpxF1XOfRH3sjG5Yg=
X-Received: by 2002:a05:6102:50a0:b0:7d0:6cf3:d8f6 with SMTP id ada2fe7eead31-7d5060e8bdamr2572164137.28.1794494291617;
        Thu, 12 Nov 2026 06:38:11 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c1fffe12dsm5177230241.5.2026.11.12.06.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:38:11 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Thu, 12 Nov 2026 11:37:33 -0300
Subject: [PATCH 1/3] dt-bindings: arm: fsl: Add Aquila iMX95 with Lotus
 board
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
Message-Id: <20261112-b4-v1-aquila-lotus-dtbs-v1-1-ca150bb4b0f9@toradex.com>
References: <20261112-b4-v1-aquila-lotus-dtbs-v1-0-ca150bb4b0f9@toradex.com>
In-Reply-To: <20261112-b4-v1-aquila-lotus-dtbs-v1-0-ca150bb4b0f9@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794494281; l=979;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=w8xV5uoMa8cD2NlGBmwvt8C0f0XkYqYIH4XfKMrB858=;
 b=fGueRKxvIo0asCUZ/33z0mlbmgMfn6W3MWKV8yD/ZkS8nSzPp6aaqZlzCeST6DLUIrWLorE9q
 OB3V6+2IU4QAr5am7I8Qmrf8KBbMoeyEU8gkWEXU6B/a5GtEeX6VV9z
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Add the Lotus Carrier Board mated with the Toradex Aquila iMX95.

Link: https://www.toradex.com/products/carrier-board/lotus
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index c8290a83205b6..392e019e7ffc8 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1607,6 +1607,7 @@ properties:
           - enum:
               - toradex,aquila-imx95-clover # Aquila iMX95 Module on Clover Board
               - toradex,aquila-imx95-dev    # Aquila iMX95 Module on Aquila Development Board
+              - toradex,aquila-imx95-lotus  # Aquila iMX95 Module on Lotus Board
           - const: toradex,aquila-imx95     # Aquila iMX95 Module
           - const: fsl,imx95
 

-- 
2.43.0

