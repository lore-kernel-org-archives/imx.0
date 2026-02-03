Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0500F3A4F58
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 14:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770127706; cv=none; b=EtOg4pBqtX9ux0TkQYrfUdGB0h0XMTUFjH1qmB0Z/S/0ymaY888Ucb8PWSECOfLiccZpvxRx87MJ1daRqONLFq1dfvejeITI+hqtbgCAqz4hBvmA5HP5h1I59IybK/bUnrUoSAjSEfZnZKZuPkEhbKhwYmvzpfBjzU7nciOYIDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770127706; c=relaxed/simple;
	bh=7ZLF4iCQxbFTodP5/N08fEkFkgqaaRd3959nJlVr5Rw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l71Wkuod8ALT5pBV/KRXAezQbRcU59RCgU+FNTvtMOJhJPJbSxMnH+2EibK+ZLt7A+TRc2KlyCv640x2J9ixQ6Bk9vI6PLXjXgR5PZdPcETOODV7olWlR4QlsisbbqT3cI2QZVykc/WeAWD/JpMg0Y9IOPqcXFsWaY1V+Px/yXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eQT+JoVx; arc=none smtp.client-ip=209.85.215.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQT+JoVx"
Received: by mail-pg1-f195.google.com with SMTP id 41be03b00d2f7-c613161b489so2411010a12.0
        for <imx@lists.linux.dev>; Tue, 03 Feb 2026 06:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770127704; x=1770732504; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vggTaQ/1IglRgZCrC6069BZ56pr4AJ+trFVQZHc37RM=;
        b=eQT+JoVxX3e6fpko+BMBm0RskADlgQDejZA2RxsYUWGf3DyAClvELz/lmDG4V5G7Rt
         Ta+tYx1v+jtuNg9F/cbozZkKzRyIbhhCOkubB+B0m6MNonA3MHbnS3nK+jCPZXiKYKk5
         rkX8hz2JiwxzDqL1qqIxJxTBvUb0FHvizIm5AiFvZjit+CD4Jll3Qg7vCXuapqT8K4It
         VAzRxN/lKFOxlXJpP3w/Cwb+XWpavFBymzYg+InVqvqq2r1DbiVkJUzAe1xnMJ7iuAEc
         yPchKeUuvLi9dSdl/NAOHlstwKKUuP02q7oLd5uFRpR/dF/YjY6wb7XQ7y8wRBc4FLQD
         Q9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770127704; x=1770732504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vggTaQ/1IglRgZCrC6069BZ56pr4AJ+trFVQZHc37RM=;
        b=M1v3D9uSn3w2S7QXtheckyC/JAXH7a0wazLlJXpEVI5DvMkMV4WFz9ir02O6l5d8Fo
         EweUTdxak20VtxO/pEs0AYBw7JJunYGnbICWg2DqqpvsoSsmBZRbzimIMHf1M8hi1WPD
         J6mHdzs0c4kA3bbXT5dwlrEP5MyFEj4+82jq4dvAkqbD2SjKbJZnKcL4wJ8NI9fvy5VQ
         8yV5rji1agbzlo2yZjFQqXvx0FwhaoxcOlv39qOF1mkEkTPexAJSottPuvicDEp7eDYL
         O3+Aw+lgqFYsuWuYAnz8NShilclPCFLku3wMxu0xUDLaxCtV1yFV3vcM1xlQw1ZMQTTt
         M2GA==
X-Forwarded-Encrypted: i=1; AJvYcCUXKBRhpK8gTsHZGBEQiXHBkgJ83bQHokt0k3AimmJgosGEWe2S5IYz8ID75vKZuj7lrw0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwvEEACD822ANERbYf2iwE46N4CmkaI3zlHKZIidWwVq2mhgLe3
	5SrZgj6yqvEVar6DWD5kJtG3HmOPT4VlTcYtrtKmsCwGm9G8oTyxnh7D
X-Gm-Gg: AZuq6aJjCoazQi5j1FV7typ158rUvsGbP5R3j13m3RwIKSl6EDV3VT4N35dUcB2O5py
	QxKmqpr4myJWbz7TKMo8PU9BiUKgyFSx0utpP2kfQxxybR4MZ7MeY9DHBVm49TFslh2rxXE9bTA
	N8G02Gc6d2+LW8h7RhDZfJeCXNMzG4ynju2C5rXgo10gYoc3XZ3DlUEk4n6FfzhlkjBVoLebHSu
	T9ttkrnCQDPG0BFgowwSqVFCEa0lSE8qeUdtUH5JkUK9zyb8weDYlB7B7DQxM0MM+GITP8Elhpv
	eLJZAo9L9EaQa39DjWHJdTKj5rzXs/4VFlxG2mWRyRrd7oj2HjsF/RIzFk01FkL76fjGF/vmr2k
	GqK4IhNp1+egyVn/PlqviU4ecB/mkSOkpJpTWciiNsQITNxnv1/xDXwwVwlSpSxTG1/DczTg4gZ
	WH0aM2tw7iJuj1PuaKuMcgqzmC+PtPW9pg/Ubm
X-Received: by 2002:a17:90b:3b82:b0:34f:454f:69a9 with SMTP id 98e67ed59e1d1-3543b3b04bfmr13811322a91.28.1770127704120;
        Tue, 03 Feb 2026 06:08:24 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9008:ba52:f091:7dff:927e:f788])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3543d52c396sm7694684a91.4.2026.02.03.06.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 06:08:23 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 03 Feb 2026 22:07:58 +0800
Subject: [PATCH v3 2/2] clk: imx: imx6q: Fix device node reference leak in
 of_assigned_ldb_sels()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-clk-imx6q-v3-2-6cd2696bb371@gmail.com>
References: <20260203-clk-imx6q-v3-0-6cd2696bb371@gmail.com>
In-Reply-To: <20260203-clk-imx6q-v3-0-6cd2696bb371@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Akshay Bhat <akshay.bhat@timesys.com>, 
 Ranjani Vaidyanathan <Ranjani.Vaidyanathan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770127681; l=1463;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=7ZLF4iCQxbFTodP5/N08fEkFkgqaaRd3959nJlVr5Rw=;
 b=DCfqaRTuO/c9AWvt1I0DC0keOeLbELpHdMjClHQL8bIs/5szqeMTmhgfJZppc9gcC1f2quZJL
 unhYgZsD3wQAt48+SEMgmJH6spLmHlOQqnVc6AWYJIlz4uL3VkUO4WY
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

The function of_assigned_ldb_sels() calls of_parse_phandle_with_args()
but never calls of_node_put() to release the reference, causing a memory
leak.

Fix this by adding proper cleanup calls on all exit paths.

Fixes: 5d283b083800 ("clk: imx6: Fix procedure to switch the parent of LDB_DI_CLK")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/clk/imx/clk-imx6q.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
index ba696cf34fe3..048e2ddba490 100644
--- a/drivers/clk/imx/clk-imx6q.c
+++ b/drivers/clk/imx/clk-imx6q.c
@@ -188,9 +188,11 @@ static void of_assigned_ldb_sels(struct device_node *node,
 		}
 		if (clkspec.np != node || clkspec.args[0] >= IMX6QDL_CLK_END) {
 			pr_err("ccm: parent clock %d not in ccm\n", index);
+			of_node_put(clkspec.np);
 			return;
 		}
 		parent = clkspec.args[0];
+		of_node_put(clkspec.np);
 
 		rc = of_parse_phandle_with_args(node, "assigned-clocks",
 				"#clock-cells", index, &clkspec);
@@ -198,9 +200,11 @@ static void of_assigned_ldb_sels(struct device_node *node,
 			return;
 		if (clkspec.np != node || clkspec.args[0] >= IMX6QDL_CLK_END) {
 			pr_err("ccm: child clock %d not in ccm\n", index);
+			of_node_put(clkspec.np);
 			return;
 		}
 		child = clkspec.args[0];
+		of_node_put(clkspec.np);
 
 		if (child != IMX6QDL_CLK_LDB_DI0_SEL &&
 		    child != IMX6QDL_CLK_LDB_DI1_SEL)

-- 
2.43.0

