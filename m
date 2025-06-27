Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64A1229B18
	for <imx@lists.linux.dev>; Fri, 27 Jun 2025 08:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751011322; cv=none; b=gaRIvQ7nJ4E/vFojMF/Dcvwb0KNiT4fwtQVKGuNb4UvrMc4OFkZLl5m+oDwyXDkiZdGQ4FPHXoAw+O7LFrIMtMkjVkgBsbq9HOfDsJ97NrSw4cDRDBbk8tY4T67QyxBIUMY6D5GWh8DJ0hbtUrme/D2iWY2GYp2Hxk8W47iz67Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751011322; c=relaxed/simple;
	bh=Iy4rMuXXapFTx2kjSKugMlp9I0/iVWn0dY70WllqPHU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AKvtSDGLi49qYoekYgFoumNpIIxs98UmntZgHPKEQXJsvvidxqduW+ChzQlKBMc/g+lgvrqCUqaZqdXZaomkxiL1PEck61ZwAYIEha4stvz+tnj6F6oJYAnOiJhmCl0zogsxpvTu6qSaaOM6Nd0Bq7+wuaRqhaUlyfI5OpnUsaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L7i6XSro; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L7i6XSro"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-453079c1e2eso2152755e9.3
        for <imx@lists.linux.dev>; Fri, 27 Jun 2025 01:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751011319; x=1751616119; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Unci+r7LHL+lqoLwxDlrvWa0BMlTjBqi0rK62HQ+/+s=;
        b=L7i6XSroxxax6gaiQoMbp/pPjZTcpECIDwxC5yIKC1/3sN2ZpKKFFU8TxtF5QpVFji
         HxjOPnxpCj1X+asw5Etz/fmmlEgRozJwHfz7fEELUrjRf40niOHt8i6fNoDnRQzcanpg
         wvemGFpFWkRDJzpJcTOqI10+FakHrPIB6CXe5TGQ2I2xGkAXwKJVvTvWCwObzVSFAvri
         uQKADCkw+yS/wGmSkkxeBHXRBXnfmWlvCwuVRs5t4t9S9iVjgLF1r5rhnxel1jpjXqaF
         e0UeFLDkDBORG4OrwjP8epaWJixQS3ONB5ommbCIF0fuXCE1e4DjYSLLoYWc1oVaisdi
         4eoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751011319; x=1751616119;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Unci+r7LHL+lqoLwxDlrvWa0BMlTjBqi0rK62HQ+/+s=;
        b=XQLAw8asjzu6I+2y5bLjR1d/Ib8pKbhZJS6yO5RXiX6DrL/XRP88RHlpXy4Q8S/8YJ
         TH+O0mHbpiNZ4ywN3opuL0hSB9Rt9Js43kLWBVi+fR5Dx6cGYI02EhHchwSEqZokbSc3
         WD19StcOg56Q7w577IwtlFnUTKHMRApiTO2+aecBZZwJggmDzPGyGtDpOv8wzkEkTEGR
         LgcrFvr1rdN6z3WNcAwjPFinH/QOqLnsDfg90qAPHgikaSgXTP5wU+KOdJqBKpQgLT7h
         IRvQPz3jvybSzmFSkWVqTEZxOJVprpPsjhyCclQ8rbPeczK5velJeWLXERD5711Xnr3V
         GMdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHY/0X6vYQUXAmZJWizwA8Y0UNsX86J7C1rflFCuvrhFlw4bsjT88rvUm3tRDVyUQktL0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+4st4tlW0E7T4iXpn9E5ZLer0X2RUkUcovCqeHBiDK+H11cBg
	D1+zBZ9x+mTx5WoVZGo1S+KgLCvVfyucBPfx1EwxhKYA9Sr18zsV5QBVBFN/UOrH4mU=
X-Gm-Gg: ASbGncu719I4MtuM7KxzE/SDhQYwV0cUn823uEavF9Krpzx7OBJCdSuDqQHJ61pIo4A
	SfkybrTQvaLazo2EUp9HeXfp1N67WFsh2vL4+8THrQkK7TVVfll0WiOIZTAWRjEkB8NzBh2nJ6M
	SLadCA/sbTxrZ7b9jVSB4Zm3SkIZaFc5WNi1RMyyNL48WyLsoRNWHcbPmfV94tA/6H4anLHrOC1
	YmjmOqvn25ZDkLjs2QJiCGQ0+v6C3mRczlXxP3t7FftJUxbV0HcvnPoouBQ9/baTAVrUPFiFBGT
	Tw7ne9I1oNSj3T66JGszCV0iNM/vS9s18QSRjTHPBcS/Q++yO8DSDRZPgmbXUngE/5TJK0NbIHr
	g
X-Google-Smtp-Source: AGHT+IHcfWFGNWC16F+T/5JDKvwd7eGwjNT+A6IGrz+imkl5/bKkRK92RXClDJ3nlxfVmYvbeGIitg==
X-Received: by 2002:a05:600c:a08b:b0:450:d5ed:3c20 with SMTP id 5b1f17b1804b1-4538ee7446fmr8751165e9.6.1751011319205;
        Fri, 27 Jun 2025 01:01:59 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a423abbsm43490295e9.39.2025.06.27.01.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 01:01:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/2] dt-bindings: Drop 'db' suffix duplicating dtschema
Date: Fri, 27 Jun 2025 10:01:50 +0200
Message-Id: <20250627-dt-bindings-db-v1-0-d5c7072acbee@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO5PXmgC/x3MPQqAMAxA4atIZgOx4g9eRRzaJmqWKq2IIL27x
 fEb3nshSVRJMFUvRLk16REKmroCv9uwCSoXgyHTUW8G5AudBtawJWSH7SjWEnXeM0GJziirPv9
 wXnL+ABL1hPNgAAAA
X-Change-ID: 20250627-dt-bindings-db-38eaa005ccd0
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vincent Knecht <vincent.knecht@mailoo.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Li Jun <jun.li@nxp.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=755;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Iy4rMuXXapFTx2kjSKugMlp9I0/iVWn0dY70WllqPHU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoXk/wcCM14kQDF1d79XXpGo8n5HZzTk1uWzDKp
 WTG1g2l4lSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaF5P8AAKCRDBN2bmhouD
 1ygSD/9zKEcjWzeAnre3VyS4sy8f/zuzk+6aiVwKfnQZNwMLddjHQaA4tfav4oTxeiUDcSNL+Wn
 OMw5i3B3nkWhbJbCvXb1c9IIs4qgDoSs4y/ZINqcWYZi7JuadQq3iAmvUQIDpctu9n4oDo2fPb1
 QldagXo4+4ICRKcYtBlC27JKFS5/Nyjk3RFHS0wii8DA+I6f3rN5Cia7d4KGVjP8sfI+lGSdpD6
 d2P/A+kT4bQA6Py7S8kPKt7QgqQbpRb8wi0+PE/J1TRQwyyfepG7WAZ3nxOzKvwcpRMnazhaCKz
 H5ADmhne9Co11Z0QG1QDO/GE5zh6jm0EmHfAOCBFNb8jEJWvsm8/eQkWq12GVPBeqitfEvycGBV
 0PVlCuEeM04wH5rKeXKYYILSX/G3EtUFBmg5cK5HRgvYb/O+H0o9PBz9UBf30NeqT96QQFl4PNQ
 lXTA2aPpeneel0hmnCgE/y2BRa2WQyIuz2VRRJQnPd0llunwXN+DfXjYoPs0nhIGTDX8so3mII1
 QAMHU+cu9+B05r4P9F06eEAGIqitbczfPPpIZ0ZL2F5PeLCAX/U4Qw+nnRfdMxbFX1oB1/xG4wm
 igtpvpkYIau9eiYialHk0wxplMxEBmIMR8/2wEhyEOmomVGoEaWwZLJixnDMgYzXoLLVSsGCSYv
 MF+OFeWgcqtydng==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

RFC because this depends on dtschema changes and should be accepted
after new dtschema is released with this merged:
https://github.com/devicetree-org/dt-schema/pull/166

Best regards,
Krzysztof

---
Krzysztof Kozlowski (2):
      dt-bindings: leds: issi,is31fl319x: Drop 'db' suffix duplicating dtschema
      dt-bindings: phy: fsl,imx8mq-usb: Drop 'db' suffix duplicating dtschema

 Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml   | 1 -
 Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml | 1 -
 2 files changed, 2 deletions(-)
---
base-commit: ecb259c4f70dd5c83907809f45bf4dc6869961d7
change-id: 20250627-dt-bindings-db-38eaa005ccd0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

