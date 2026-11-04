Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788588;
	b=yGxdmGUA1TQSDXjvwX9DIztq3klz+Z9oBquThJvuJ8llB7JS8utj9lhnoUZ5uTdFhJlW
	 0e09OLv6Lij5ykdeh414UfQKkan569NHxgWkP5tFPjQhvToCIP5cupmuX8FVHBEwKZqMj
	 mIMhajYPf3cJUnjn3IbpA4+//JuzQBuF1jp+YGTOqT041KaWUlF87phqEzz5Q2FG7gruf
	 PK4L3ahEdxQ8TEmXa5zvqFOXtBym7V3V+tQFhO1ylYnTbjKgx0ChlBlfU/O9DrQFZxF9m
	 iggQIgC+Prap3b2trDW8NzZxWu5kKfQQ7NiRdbi+Wmj1hy4T70PTC0Tfphbly2wIZKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=g8GDWpuJEEwiEELyHxABV+752CFxaNvpiplpVAXeeOs=;
	b=dwoLi5zIUfqEB0S+Z8L/YBfYFAsgoSqu98JwApMnq9nSgHe2VuCK1VH0BhwDFOLjnUz5
	 x1L+9wYHb8t6Rl+14jNmiQbE4qTx1yniZ++6gLWW6Ndit0g7iOjbOEC8H+nHIvshb+HLE
	 DFTku9UhKWA2bqBtU5oCK2oColfln0AFllmj6j32Wf2c57q8iOjKg33zCwjL2V/Vq2JzG
	 r6CXOWup2+LznT/Vu1UUYhFnlHw/ByXN4TSTnlDqThTrj1i2UMrYISPhV1T3xKd8wx5rm
	 9LfF6EApH9LuphrKFeIfAHgyk30jk1FAgGppiiaZzEi+oz5S9o+wRvBNjpEEZE0skXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=PanfijzX;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBE5606A337
	for <imx@lists.linux.dev>; Wed,  4 Nov 2026 10:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BBE5606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=PanfijzX
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so3480825e9.2
        for <imx@lists.linux.dev>; Wed, 04 Nov 2026 02:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793788587; x=1794393387; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g8GDWpuJEEwiEELyHxABV+752CFxaNvpiplpVAXeeOs=;
        b=PanfijzXEiDFqpzydeAd1W7rJmONtc5AtZa7C49QqHKi+3g9m1b6t454/57PBIp+A1
         aOnr9UqDBOQn33SEYHHmTwms0BEjSjcWhsbpte8uHwhB0/p6Ko8R9mDEJ/m/mnS3DF+S
         ilfzqTGRe3mLj6UxUjR/RwmmWHLNJYF5T/efQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793788587; x=1794393387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g8GDWpuJEEwiEELyHxABV+752CFxaNvpiplpVAXeeOs=;
        b=a7y2+DqMCE/s8wWRS0G4IWmvPeIriLWVB6j9Llg4MAnsnQrb/GaFu5xddoXiFtkbqV
         gU6ZFO69UkhB8ozfo5L4lcW5w83th5T2JgoewDQ7sxkfrISUB4bbeF04CSE139BsYkq5
         i0XhjxSbQugWijYQJ9cQrUF7bsOgwsd+ZTrcXSqWrJHdkjzYRNlxRAsDIqoQBCxH38Vv
         kErH9HgFX3hr2nlJUC6KyuPiWVLhxKZKodwJSyyffjyAADxMUMk4B+HugPX9QWN0pC9b
         9HDBBH7Sg+R4NtD9glKQOgIJXq7+6xNrgA2w4ce3NMVQM8TGD5+LHMZP6ujW/BEEvbc0
         zwuw==
X-Gm-Message-State: APuU4Z93lo/fHNSnYLzRSwdNpQAGATfed++F7EdMWtOXQioCI8aYlLIS
	5e1fnxRymtMdrGdQeK9EUitl4uL/qdI2AL7WH6gG3GVhN2LVBW2Dgi2f7QRvd8381HA=
X-Gm-Gg: AYBFou3Cc1b2wINPQd8vtbccNlM3YY+i65m1m0EGgMDyd0Ih/kJfaoK7vXaJWJfN79G
	ceOPIKSZvDIdSg26xkHKqA5Sn+FUVrKA86jxv0aEu5c9pWFrJFcGMuf9WU64UBI3YtqQS0X02CR
	dVt4xlsZNjVCJEwKTGYcf5+mx4eldW3aERU3HWjy59Qbj38ThaaquPrtXLxKlZ3lvN8Xk1WUTn7
	SvnAZyjIngwv/02pMIDKF57qSKkankU0MtqEL9awkqYEJo7ab8cxbWWDQ2V/mXnCM5gj1imf8vp
	9Kp4L7jpm+SAWnSGDteZ7z1zhggrg5wlscUGE70y41fZyuw3P85HGXM2xyjtLekEbmvczJJ8iYP
	BJtSG5GmvD8Jb+JmvRCU9HWZ7f+OFN2ddl9wyrfEx7UvnrjowPSdwgeQD67DjAI6UwYcNlJTlP4
	bMgWwEw6nHBvLZrHsHUmhAIbeh9kDnWBWNJ9fg56Wynl2fVMHC72RaP9TM2i5z89Snz0qLdNU4o
	A5wKc0Z+7ivo6bnumD/578yaY6aCTSEesdYDp8wQSdUF4GCtaJOombF+/jUl5DFZKj3X8ucQQJQ
	rSImg5VjTsUe5g2z6RY4Cf2WZnYCX5Lz4VSBzemjKhWdOFvv9PT+dVImYk6+uSRQJvDafbHdS0O
	bW6SA3UyJAjYJkFevfBqnd6oXANLyoUXMJ7VklcYqK2NGOCGBSLs=
X-Received: by 2002:a05:600c:6087:b0:49f:f099:6fb1 with SMTP id 5b1f17b1804b1-4ac17753befmr352610105e9.15.1793788586637;
        Wed, 04 Nov 2026 02:36:26 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([217.201.213.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2afee292bsm141685155e9.4.2026.11.04.02.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:36:26 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>,
	linux-amarula@amarulasolutions.com,
	arm-scmi@vger.kernel.org,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	stable@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v15 1/2] clk: scmi: fix SSC spread conversion
Date: Wed,  4 Nov 2026 11:36:02 +0100
Message-ID: <20261104103620.4054694-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104103620.4054694-1-dario.binacchi@amarulasolutions.com>
References: <20261104103620.4054694-1-dario.binacchi@amarulasolutions.com>
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

The spread_bp field of struct clk_spread_spectrum holds the modulation
depth in permyriad (1/100 of a percent), as documented in
clk-provider.h and in the assigned-clock-sscs binding, while the i.MX
SCMI OEM extension expects a value in tenths of a percent, as pointed
out by Peng Fan.

The conversion divides spread_bp by 10000 instead of 10, as reported by
Sashiko, so any valid configuration is truncated to 0 and the hardware
is silently programmed with no spread at all.

Divide by 10 and fix the comment accordingly.

Fixes: 77369b1e6a37 ("clk: scmi: Add i.MX95 OEM extension support for SCMI clock driver")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260901155657.6A5981F00A3A@smtp.kernel.org
Reported-by: Peng Fan <peng.fan@nxp.com>
Closes: https://lore.kernel.org/r/ZR6PR04MB375776A27E98F140534E8F7FE488B62@ZR6PR04MB375776.eurprd04.prod.outlook.com
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v15:
 - Add Cc to stable.

Changes in v14:
 - Add Reviewed-by of Peng Fan

Changes in v13:
 - Divide spread_bp by 10 instead of 100 as requested by Peng Fan.
 - Rename the patch title and reword the description accordingly.
 - Add the Reported-by/Closes tags for Sashiko and Peng Fan.

 drivers/clk/clk-scmi-oem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-scmi-oem.c b/drivers/clk/clk-scmi-oem.c
index be11d359b4ec..c1ebbdc6bbc5 100644
--- a/drivers/clk/clk-scmi-oem.c
+++ b/drivers/clk/clk-scmi-oem.c
@@ -39,12 +39,12 @@ scmi_clk_imx_set_spread_spectrum(struct clk_hw *hw,
 	u32 val;
 
 	/*
-	 * extConfigValue[7:0]   - spread percentage (%)
+	 * extConfigValue[7:0]   - spread percentage in tenths of a percent
 	 * extConfigValue[23:8]  - Modulation Frequency
 	 * extConfigValue[24]    - Enable/Disable
 	 * extConfigValue[31:25] - Reserved
 	 */
-	val = FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, ss_conf->spread_bp / 10000);
+	val = FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, ss_conf->spread_bp / 10);
 	val |= FIELD_PREP(SCMI_CLOCK_IMX_SS_MOD_FREQ_MASK, ss_conf->modfreq_hz);
 	if (ss_conf->method != CLK_SPREAD_NO)
 		val |= SCMI_CLOCK_IMX_SS_ENABLE_MASK;
-- 
2.43.0

