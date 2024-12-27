Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C60C1F892E
	for <imx@lists.linux.dev>; Fri, 27 Dec 2024 16:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735318657; cv=none; b=am70yO+v4sQtykMqpM6xsJR8SMI596N8ycQoY2NW8j7wXpzHUjhDiCgvkBvW3UmLingno+88/NJjAyiG+b5We9BT9OeD/J6+aPk0n9nrtDXXotmfNQmB46o0JsJ9CsxONLIjUp+v9kLAdbWmSkYfA7vvr9RO0/DqyDbftZuIicM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735318657; c=relaxed/simple;
	bh=4JJzIfTPYd1xwS7ML8LLTZkwdWqlo3aofGz7RuYx0M4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HUFpVEybuGLqkc43JfAhpAA2TkYNs0zkto3iVVfpTQsPhN6LtyJQVAMM/w0NZqJShpwFdBFpHgoucoNmh5nPr5SgRx8BnnjUFLg/tNOf+cAT8mux3kxgSRd7UCthoUdJfHO8xoIWQfEBiQGK80z1EB48FG6KCOXhy57tU2BCeuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=KkF6UOng; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="KkF6UOng"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d3d479b1e6so10059667a12.2
        for <imx@lists.linux.dev>; Fri, 27 Dec 2024 08:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318654; x=1735923454; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=;
        b=KkF6UOngHgLUwD6hUrQptqKgDUkLa193PNMxpoGSy9jHXbdTeZUAlUJDkWkQlRJkYM
         GGalI4aY+GDJjNJYQH0VfzLACRKFiKtARYAQKSeJdb2hzcPG9iTyNcTyr4X45Us5i2F0
         4JgOnFbvllDa8VPfvWFz09b5AByc2OvjxwxAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318654; x=1735923454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=;
        b=Z/oLMxezOv+SWMHWU1ndSMI6Xp0m+25DJ7Txv/lqRjFYfUFuNGNkC31CNK0+kZFShn
         AiuQeI+0VkaVM6FUo/e5HdTgDeGU8qUM+8xVVdLaEEQd+9/X709sqCqCQlHzE4xQxCjA
         Mjqplp6JVvu6fAQCrjZpJMk3Z+PzCUmrYyYkVdn+YPRB/3JL4TdWIG0PRSHaBAsz6pbN
         GJTmKCjKEY8gbIubGsUIHHJiFbrWmn3xnn9uppZzVg531TxZRrIveiA+7ETTiynvKo3y
         dX5NP4VhZTIjGD79daQQ+iV8CtFuy9nGYyiNgY9BtT2MH6vprEBNoRBOZF07Z66WyRve
         9qBQ==
X-Forwarded-Encrypted: i=1; AJvYcCW33mHkH67euPIPfyPS3pU2KwZ+P8SF75+7LvZAALBqU5DFjiIx4tdZUp0Tcrm6Of7bYos=@lists.linux.dev
X-Gm-Message-State: AOJu0YyrucOMqnqQ718cfB+/hNrNo48koReG3/1CTqRokN4rL/88PdQL
	6n4akhsynkDkszAIYClriPUx86VgXZxLmYk8Q9txPKSffLdsn0rFg16w9UvR7Qc=
X-Gm-Gg: ASbGnctkXe+0sUKlTdLYq+AUkgQUYlHynltuZ+oe5IYfHRw8HkGBe7qYwZhnmU4KEme
	nz1plr+p2qmdJYrUuC/M39MnmxqA/WI6/qVotFChBza+PHKo0dvfP1ZrpffCdDl9k4ORnyXhLYE
	vfv9CGli3K/2fOtGWsjcVj6GcCemUHn2Wot/hqP5Oqhih9kKWauTzOvcssXvAkdvZQqEjNVisvL
	APvjiKJMHW5kcoWyRRRSkb8CGkgzv8Ex7sWMOBIyrhgKFqh56eSBN0oB0sy5+ry6MvUCo9cI1Tc
	CNPCpTjlHN6rfn9JgruR/Q==
X-Google-Smtp-Source: AGHT+IFlmdnMThLPb9EkkuKwMxGI60ovbSUep0LqlOvlgpARRv5AlDDZd5jWQljGYpDND2+/ZP6Adg==
X-Received: by 2002:a05:6402:2693:b0:5d6:688d:b683 with SMTP id 4fb4d7f45d1cf-5d81dd9c716mr60767226a12.9.1735318654135;
        Fri, 27 Dec 2024 08:57:34 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:33 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 06/23] arm64: dts: imx8mm: add anatop clocks
Date: Fri, 27 Dec 2024 17:56:09 +0100
Message-ID: <20241227165719.3902388-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
References: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add clocks to anatop node.

Add the bindings definitions for the anatop node. The patch is
preparatory for future developments.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 4de3bf22902b..597041a05073 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -600,6 +600,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0

