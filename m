Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788591;
	b=efVYBaZqao5ihpTnon3zySJPUdF+ZH0xqG5sSEdYmegUx6tL9BTjN7EknQlpa53zHL4W
	 MPRu898cy8+LBptk6YS/kEZuVdMWozjLDzM/yxTNZMjOQz+u+A4IUarM3mjoYuT+mlBjC
	 /zqLB2weAS6+zHcDwWRF6bI4iIGJ7LNCPZRgNhNxTG2suyo94GYQfVCs7bRatlOkAa7U5
	 ZPN3wb1T4a6aezZRenTDCMvrEbYyzVQQTsjmp4anssnDIvwvxLqw2WL+9xWrTJssFouZm
	 jdp6TvxlryOMNqHl+LZhkBs9PuqHmUJY7ZDn9FB4ndv0KU0gzyf/RRs30vSn7ejFlwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QmhceGpLe8h0omEeb2M399Xlx6YguZcLcPtiMm/jwQM=;
	b=vqtEqc4RQ4tzxOcTRnRT1+9q2ZIb78f2v7A3QHYYp0GEGeptn0kYCdaERKrEC5qXMTpk
	 3sdCcPW8QJ+YFF1kzQ7utBOt9OGDjigstXAaDu3f+zyNsbA1gABiEX7DaREhQEs8x5Tre
	 d+b79K25TjS5cBORidXOxS1XgMb+g2/Qy+B47FGkpdmjqxogrAD/5ku5hJCOphTinCErG
	 +FvFQrx13wy9onsvalbcSJAv6h4BJi74BlHagVYlVelF9efKLPR2pcxZDTij1sD8M7ntz
	 Gi1zfuQL74eBPVHIPRlXz7j5CUxDX+9yglTlRaYMKC6qAdEt8P4xCs3wT1BSJ7e5K/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=BC7uDgyR;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C31606A32E
	for <imx@lists.linux.dev>; Wed,  4 Nov 2026 10:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42C31606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=BC7uDgyR
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so3402765e9.0
        for <imx@lists.linux.dev>; Wed, 04 Nov 2026 02:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793788589; x=1794393389; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QmhceGpLe8h0omEeb2M399Xlx6YguZcLcPtiMm/jwQM=;
        b=BC7uDgyRSU/cOnOTGA0SHe8+qzU0bcavB7F0jBqeGzSTkmBMMUwqjyT+5LmOYTkd0K
         XVEB8+531xeWklpRHGWxdNhzJQEZRk1UNWoN/352RMc38TyueCTIoE3Ri55icRo7X+V/
         xDhfOwe9gEPHRsR6EQqDcdhhPI9FBuLUU+kEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793788589; x=1794393389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QmhceGpLe8h0omEeb2M399Xlx6YguZcLcPtiMm/jwQM=;
        b=QslqJcCWn/zOQFT/1RwKVFdTyLTnIj3UGnFx4w2knQg1369PZ094z9ZEMyUCmhaTtf
         i/xkbTQgBG35NgGtDmlorwaM5wfKjkiejGC44PWEWzbWfKwEl3mkrHyK5BdoRKkTx8ge
         miskPV3zo/xUx/67PCDLJrLyM0MteA9oIe9W58otJdqx8OieS5EL62/gUZhYQSKVgrF6
         POC3yT4HJjCdZUcpoyE/m1PyyXhRFULN6a1zFo5HvYgrv+91uQArFPCwlCRFLmu8S2d6
         wCWyclfQUOPGVFNDj53zC9hwi1zB7DwiGdORDAbQUCIi4KT0irPRMw0AhNQZWk3B0RXh
         sTtg==
X-Gm-Message-State: APuU4Z9Vjekyq4pqugTFH18qoip/SblOKYPdOM9524Vpg0xAbq8BnzVy
	6HQLcTTxh5lMA+vwn6ptDKI0RpAGHEkE6xg5v5QdQ5pMhSaijBd4Xx9LTzmwlbbgADU=
X-Gm-Gg: AYBFou0wqX9a6y8ZivIxlG6cb/CE0XR8hVTF8Yz6ik+ypfPRYXJBcoeASZPehozMJQO
	zAFtdJrd4DP3nzmESCpLQNFWE0q19568/NJj8F2w+XkKGCg0EcTbRFM4BvSFh4hGvp4xcHb4o6z
	q6FUafJ2+mXrRZZPmTJVMeWQ7Utr+ZckYRRjUtXI7+HP1tsr+sGJN4Sfd79h0yx21DFdPkpoCnU
	++fzV+cjuUIR3eQ/nngHm96HUCF95A46qStumubLPqlNxalH+1LYFrKdZF8hzx1rTYsqFvAI4gU
	JhcUdVgw3DYFBbS+YT2VhAaXQ5TYQZf2/N3AeBF1Q2pHRZ0R6J8qWDzOMruoK9quNMTO89jIUxv
	SSErRyPaHEYTHurf8om1U0KP4Tm1tiZvjiSKgP0u0dYYEPqGKNy+IWv94N1IZYpYWgAk90OnxIi
	MPbdR/sFRdp3cuV4uSinkPNXEDglM8ncFkzRdbwB8iWiIdKlEp+tWaaRqqmPR7GFH6xI3e/y0qo
	Mx4oq9kChUwHeJxgm/ZmIP5vQJxx5/hkeV7cIeJg1plbXYOoW56SoXeBgP0uHLYI+vmV2LSCz6t
	DoYZBASYp43MZIhGwB0qDJYo9Ja9ZIUwlxyzXEjnWcakNChoKrijMW88KR84djg1vpisR71zpxe
	5xKO4SvJgjhMMg4jOZlPUKUeVYtoI2FDDZS8uTs3jNcmSIpnni+c=
X-Received: by 2002:a05:600c:1387:b0:4a2:729:f7ce with SMTP id 5b1f17b1804b1-4ac17d16afbmr361119835e9.8.1793788588668;
        Wed, 04 Nov 2026 02:36:28 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([217.201.213.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2afee292bsm141685155e9.4.2026.11.04.02.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:36:28 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>,
	linux-amarula@amarulasolutions.com,
	arm-scmi@vger.kernel.org,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v15 2/2] clk: scmi: reject SSC configuration out of the OEM field range
Date: Wed,  4 Nov 2026 11:36:03 +0100
Message-ID: <20261104103620.4054694-3-dario.binacchi@amarulasolutions.com>
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

The i.MX SCMI OEM extension stores the spread in an 8-bit field, in
tenths of a percent, and the modulation frequency in a 16-bit field.

FIELD_PREP() silently truncates values that do not fit in the target
field. Moreover, the conversion from permyriad to tenths of a percent
turns values below 10 permyriad into zero, which is then passed to the
firmware as no spread at all.

Reject these cases with a warning instead of silently programming a
configuration different from the requested one.

A request with no spread method disables SSC, so send a zeroed
configuration to the firmware in that case, without checking the
spread and the modulation frequency, which are meaningless then.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v14)

Changes in v14:
 - Send a zeroed configuration when no spread method is requested,
   instead of rejecting it, so that SSC can still be disabled.

Changes in v13:
 - New patch

 drivers/clk/clk-scmi-oem.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-scmi-oem.c b/drivers/clk/clk-scmi-oem.c
index c1ebbdc6bbc5..29acd2923fd6 100644
--- a/drivers/clk/clk-scmi-oem.c
+++ b/drivers/clk/clk-scmi-oem.c
@@ -35,19 +35,38 @@ scmi_clk_imx_set_spread_spectrum(struct clk_hw *hw,
 				 const struct clk_spread_spectrum *ss_conf)
 {
 	struct scmi_clk *clk = to_scmi_clk(hw);
+	u32 spread_pm = ss_conf->spread_bp / 10;
 	int ret;
 	u32 val;
 
+	if (ss_conf->method == CLK_SPREAD_NO) {
+		val = 0;
+		goto oem_set;
+	}
+
 	/*
 	 * extConfigValue[7:0]   - spread percentage in tenths of a percent
 	 * extConfigValue[23:8]  - Modulation Frequency
 	 * extConfigValue[24]    - Enable/Disable
 	 * extConfigValue[31:25] - Reserved
 	 */
-	val = FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, ss_conf->spread_bp / 10);
+	if (!spread_pm || spread_pm > FIELD_MAX(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK)) {
+		dev_warn(clk->dev, "%s: spread (%u permyriad) out of range\n",
+			 clk_hw_get_name(hw), ss_conf->spread_bp);
+		return -EINVAL;
+	}
+
+	if (ss_conf->modfreq_hz > FIELD_MAX(SCMI_CLOCK_IMX_SS_MOD_FREQ_MASK)) {
+		dev_warn(clk->dev, "%s: modulation frequency (%u Hz) out of range\n",
+			 clk_hw_get_name(hw), ss_conf->modfreq_hz);
+		return -EINVAL;
+	}
+
+	val = FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, spread_pm);
 	val |= FIELD_PREP(SCMI_CLOCK_IMX_SS_MOD_FREQ_MASK, ss_conf->modfreq_hz);
-	if (ss_conf->method != CLK_SPREAD_NO)
-		val |= SCMI_CLOCK_IMX_SS_ENABLE_MASK;
+	val |= SCMI_CLOCK_IMX_SS_ENABLE_MASK;
+
+oem_set:
 	ret = scmi_proto_clk_ops->config_oem_set(clk->ph, clk->id,
 						 SCMI_CLOCK_CFG_IMX_SSC,
 						 val, false);
-- 
2.43.0

