Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A344F26039B
	for <imx@lists.linux.dev>; Tue, 11 Mar 2025 16:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741710866; cv=none; b=t41K2GCDuN4yZ96t8IXsEM9jyc6vC74jeTYxHBnakoN7isRxbtWT3kwFsaEGjgg2qBoHt3JyF7z7oNn+w6uO/ePN61NdY/5vQp6w1zIDMffpOc6nJuGL3tTs7n0TMcubs9oCJmM/UhImo2mr+I7pEedrRTIV8SCsD6veAzV7PSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741710866; c=relaxed/simple;
	bh=hNAzxEX6IvUio8dYBq5iC1JrFqvRdDIob8Pe6pjgCOY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FioHwYJpanapPfjLFmMMbrMe0xA1o/GoWjgy6EkaRMjHDErVV+B95Vn8fYar+zADQ6XWjGYXxDu/M7DNaXPnOX9UbWBlnlTcRZlyDuQy77rQ1NZP2qkJTGNNKF10+StEdQUkMasHCvRDyAAnPMybgqWsg8yyt9Vypndh5+z8cSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AYUUMva9; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AYUUMva9"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf848528aso21362015e9.2
        for <imx@lists.linux.dev>; Tue, 11 Mar 2025 09:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741710863; x=1742315663; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtbLHz1ogYRzWdnGh7+uet0QbKRU5Eajq4pPXQMZdpo=;
        b=AYUUMva972tQ7klJn5Naaq5VFb4oIvqha0Ys4AoQ60fuMN8vpehgcO6gD0+FRCOZp1
         ZMN9dCznDpPm3YFbOHTAG4jepmgm/NBJtzJYXw8EnadtbnRZYfrIvRyYSI6MuuMrWMph
         8xOyOK2JyeJc2i4bMpUNZW8myHY4hfhAUxcYibXdgNnas5SIAYaznMwf+pQPPkjhZgQY
         Qe1mY6A/uZLKrGWoTQrn7teOfbW2FeexFyCaOHghg0jcDLIaMEO0Tfz/2I8p3PioBRtB
         fqiSIpvj214E1Tfi62DOdbB5QnWiqYuQ7H3E1lnnT9Yh/3dBzjgCJ2jBltitsklTMTzI
         qTkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741710863; x=1742315663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rtbLHz1ogYRzWdnGh7+uet0QbKRU5Eajq4pPXQMZdpo=;
        b=SlsQbUxID5aT5wzaYxCrfJGgLnY3ZnUrdXv3TaD4zxC6r4G8JOhMK6Uj0EyUOirosn
         9jKCplxZRTpNpKbIow2gzs7873FFVIpfzLzq4cXHZDqAAWxEZy3Epqbb+yoeOWBfggJS
         ynJ3u0hiUAInYRmHgKW3fh7b3KldLT+DcX+znMa+6yKSTkRlOK6O1bor+IwPopxi+4bv
         Am4m0nJH4Vnx71HiWGt1p9FE/w9RqK7pvLFVpGeKrZUX8OKCc7GiSkOJYXdDd3aZAZB8
         aEQKoH6fSaNehG5tIq+fLsRX9MTgSdb3gmIdj7qupS19NXDMiRBTNp/LGLBLQ8aKpuqk
         X85A==
X-Forwarded-Encrypted: i=1; AJvYcCXvGK19J8dTNGA+FP8hWz3JdTbMHSe5U3GeV2/Zz8LvoUybLN6hK7+ce/tqxXuApIuXLa8=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywgp0UvYtHZbfx03cdGJkr+r46AS0QlVby+/ute4iMREcO5XV00
	eYI63qoMZNv6IYg32kT0bE25jcbOcTlVAVwoQX57PiPJeQ8SYN0f
X-Gm-Gg: ASbGncvzzcjUbbqdbUrgCaLWxN24AS4sRYJ6QvkpWexo/dt7UCyTMV7KhRYDiXTJkMs
	UjVRycpbjxt9IdyOLzxlnjDzmEYkEUUDoJzPTKsrqpJX6Hd/0Bqc3BPjTK7Jjl5di61Avx+7U/b
	cujztZT2Ed1X74vqwuTJCxwOl0Utk4h/sFe2bWz752NhBUCK+mRbIjQ/ps4DjF1LxOagJ9/7W5q
	VmYaTp8jLRfADwfTWJC8MvKCOa+T6uueVtYr4Ky0bodsMG/ebnUlNnl2RJKbDKYSse4+KepA56Z
	rDb8dsbfY+9KmDs9uLtmZq9Xiss6SrrrhXzGmS7a0x1MsfOHAeZ37AD6VrFcsbP+66bZU0f/Xo5
	r5CJLqx0=
X-Google-Smtp-Source: AGHT+IFlQFbhR6ZyJ0YJ4Jp/6nAyf81QOetcCX+atGFftJ3QGc1xuajtd/R1oj0kBDUVF3B5CIeiqw==
X-Received: by 2002:a05:600c:5109:b0:43c:ed61:2c26 with SMTP id 5b1f17b1804b1-43d01be71ecmr58521685e9.17.1741710862554;
        Tue, 11 Mar 2025 09:34:22 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d07fd046esm13398935e9.19.2025.03.11.09.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 09:34:22 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 2/3] ASoC: dt-bindings: audio-graph-card2: add widgets and hp-det-gpios support
Date: Tue, 11 Mar 2025 12:32:54 -0400
Message-Id: <20250311163255.2664-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250311163255.2664-1-laurentiumihalcea111@gmail.com>
References: <20250311163255.2664-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Introduce the 'widgets' property, allowing the creation of widgets from
4 template widgets: Microphone, Line, Headphone, and Speaker. Also
introduce the 'hp-det-gpios' property, which allows using headphone
detection using the specified GPIO.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
 .../devicetree/bindings/sound/audio-graph-card2.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
index f943f90d8b15..94588353f852 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
@@ -37,6 +37,10 @@ properties:
   codec2codec:
     type: object
     description: Codec to Codec node
+  hp-det-gpios:
+    $ref: audio-graph.yaml#/properties/hp-det-gpios
+  widgets:
+    $ref: audio-graph.yaml#/properties/widgets
 
 required:
   - compatible
-- 
2.34.1

