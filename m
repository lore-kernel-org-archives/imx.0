Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606770;
	b=ZNhgHEg2gzhe15mHYvgL8v0qbpJVGTDpkBahG7+HX8yb3fIMSN6qym0pY4EXwxj3o5kq
	 iEwgj+ov3Tv8SyosqzR4971VbvcE8oYAyGu3hc7aCLRgI/jgP1voVq1mOAC/uHxyzjLWR
	 eQweqySRUd7iuY50MPeAP5CHnnOuutzwKDZYUZg0M8M6wHHhL3x9wgpn+7z2H8C2jLbpR
	 JWjiq6ErlA+FGMBQqAfAFZUMpsXdEngoAUbDIsBIR86pyvyInuiJIdigl2iwZ/VsgpOI6
	 jSBmsgP2w0T+T5WvK+Im70+5Goqkofjt69FMEGVG+KwRKHirdJSMUX8Usr/+U2VyxNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UZYFS8MKBQc+5Tr/cyA7j0UiS2j0wQcS9XFNeP8okEI=;
	b=JNLaNdP7sEAT75QDlcoRqEDRXrYdc1QHm0R4m90Ck2G/AJ9KnGEmDfPMtJ0JD8QspJzU
	 5s7iEZ6r1TUlZAdZgnIBJqwCOaN+x+OVfDggrWPw7KmzPoObESpCGp7qGLcFE0hlC5CWC
	 g6IHx5ZcFaBx47WZsTKI2DkmWoKipD7xlxxzelJC/y6CisFIG6IFJsVUM3Uwy+3If7IBx
	 fPb+jidAnWNVaariwhom2NTX7d6Z0Ip9p5JT+h2RugMCvd3hNQ0J+5CKkxW5/MFFwwvzg
	 eI6lE4NhTQQZgvdbh1Bc/ayXTbp6cx4F7RNtHRutdAoY2BHMveFebVZypMJLoFRneBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RlAXXKc0;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9D9606A321
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 11:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C9D9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RlAXXKc0
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a2af4c8d00so3771487c88.0
        for <imx@lists.linux.dev>; Wed, 25 Nov 2026 03:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795606770; x=1796211570; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UZYFS8MKBQc+5Tr/cyA7j0UiS2j0wQcS9XFNeP8okEI=;
        b=RlAXXKc0gMVavT7QT0k/eQ0LdM5TlUWi0H9Z9pgeAL/dhRN7s3HJzgRkg84U33NpeU
         DRpT8lQyrBXfhWYZq1sMzW/6FIQz/VvLgf5QHv/Dyf+4zHwIaZ5jScP06/QbO+mx2zZO
         UJLcDPlh9BFpAtZx32tmXjOUFx/1rQQVn5e9fhkS4g9cqgRiGxcq7lDCHO7brYfhomKA
         ngsl3q6aEMsJY27Yg8Mf8/X+MAS/zcYOcM5waoRUBQlJvTfPZvNysZAYKOq8DMlloV1H
         yjtdOeUTih/fpWmX5+K1rAKS2i2Cn9fLiCZOAXyO+BJ5Qzim9CFho8qMJwIr8Pa32T/H
         meEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606770; x=1796211570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UZYFS8MKBQc+5Tr/cyA7j0UiS2j0wQcS9XFNeP8okEI=;
        b=eMMQ4hzb8hseQaaiV/p7OtWbIxURnfCfI0WdLDBGVpd+VlEAKaM1uYqU9uoh/Zli1m
         kS4kpKqMKDkfKuo3xBDh7+HdvZe00+kfWqRxS/w4ErFmagjtoKokFyb7yNcl+WpIPsXV
         mOkFvVFTiH809e5bUdNcH2/7Bu2/+/6JQ2hZgUz6KuY/44FmGwRt/hnVgZId/ds0uxYe
         oUb6R5ltrzzyCL/6qMBm7WyDvFOiInB3ldiy+wZ2MKIVdzzekkw09vK1zuDCs1oD5t+q
         fxx3mKjEd3xCgo4RjnmZVAeh0NdJBnTowDWC+FT/hjGoFnr44KoV1AcSmoemTqs2gR1E
         +qyQ==
X-Gm-Message-State: APuU4Z8b3F8//VjTQVYZkIxD4sxHIyT2je7K+Ac04r7UfkWjD4cBFWtR
	DCWWFi3q3zXaE2KuxWVzdh4IGImaJylCuDLUMxkSmaU6wH+bZy/dVjrF
X-Gm-Gg: AZFdTZdCXQ1ChbWpkMugCLXUmwX3lY7+CM8nD6O6m/b+zzSCox0DtX6wDFJqd8+BJS8
	ijvB+FyO53A2qFGnmDUPrsWbxanJIXjPHMCHDzDYRgFKnGkrJ9HSwPHGJdMrmx3L+zdh0HuWbyL
	0Pde9bD8SiDxq72yudy8TLTaA7SodqJgVhQFv7jTU4ecngaiY6/BkOXtB6RkAckQT6Z7N/Mdg9b
	opcJPTfmYTcURgw0dt690jgI8DF2on1CwNt/R8usMfEx5NAQF8qtV+4ny/d+9rto/Pu6jCilLXR
	09CfOaKWfyrT5+q1hNIJm+HgCF+b6omPr9ihXzvkDDplByt5pHXL4GL7s7gyeYgR2kh5qsTAOS1
	/gHppy9QjFzyZTbU7autsOWUfZR2RxEBpqamAp++V4JtpAP0bIoN6/JAI6exarUsKirUTuxVbI2
	G6lbAdvag/7CVDWQmG+wFuMwY6pQ7QLUc9MXj1YUsQyVIEuR+HQEENkH7UR4Q4Qi7AhCZt2KZsm
	slcuvNKSZYDUzORZ5tgqSc+xOpmVYX+KMhXx9mD8DrN5O0GA2654a/k8htN0zno1o9SEAm4OtN8
	tvYeIyJr5Y+tm0BGUUXuBapLeNwa2LcTidXXNO0lHaFpbzE=
X-Received: by 2002:a05:7022:290:b0:1b5:283:79c8 with SMTP id a92af1059eb24-1b5567a6eb4mr17106600c88.4.1795606769639;
        Wed, 25 Nov 2026 03:39:29 -0800 (PST)
Received: from localhost.localdomain ([183.82.204.100])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm47479629c88.13.2026.11.25.03.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:39:29 -0800 (PST)
From: Dinesh kumar v <dineshkumarv85@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Dinesh kumar v <dineshkumarv85@gmail.com>
Subject: [PATCH v4 1/3] dt-bindings: vendor-prefixes: Add ADLINK
Date: Wed, 25 Nov 2026 17:08:43 +0530
Message-Id: <20261125113845.297658-2-dineshkumarv85@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261125113845.297658-1-dineshkumarv85@gmail.com>
References: <20261125113845.297658-1-dineshkumarv85@gmail.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the ADLINK Technology vendor prefix for device tree compatible strings.

Signed-off-by: Dinesh kumar v <dineshkumarv85@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index e467da45cd7a..162a4a9d8c18 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -68,6 +68,8 @@ patternProperties:
     description: Analog Devices, Inc.
   "^adieng,.*":
     description: ADI Engineering, Inc.
+  "^adlink,.*":
+    description: ADLINK Technology Inc.
   "^admatec,.*":
     description: admatec GmbH
   "^advantech,.*":
-- 
2.25.1

