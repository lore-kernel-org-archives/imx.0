Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748CE2DE717
	for <imx@lists.linux.dev>; Mon, 16 Feb 2026 18:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771265492; cv=none; b=E1HHlCMxyoJ+VLo86aR75S9Hv6s1FV2cMRgADjiJTmbLEhklHpZbLuA+RgNKdcKngwjW0vMGB5nEEjta+pGfgj4avvDGQ117X3x2J87KxpiBRGo7VuvCVuUkVprTDaQB1EUR/z+Nseky90mM1tdHbDwhhaAHjvHSsyqsYjn7QbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771265492; c=relaxed/simple;
	bh=67L1y/qLyWmX5l03+h616MLb+zlkbVeX47IpEN+bQ24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pBEU3eduCIcCvKyZSvHbqV3IIRgMCJYgxhYtqsyDxS/tetAdpCSQppwrW7JCvnO1nimn6HdXWyHoLr6AH0uvSKvlmO3hbhHNGbz9sPUsSR7VLwYK3Ho4X100pcbCb5PQC7b1eFil7gsUGU3gRyTODLWwI5Fl7IlKjN1V8KmLATk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RGP25Fx/; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RGP25Fx/"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1271257ae53so3481310c88.1
        for <imx@lists.linux.dev>; Mon, 16 Feb 2026 10:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1771265491; x=1771870291; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+a1WmFTmtt2HmepX4bGFNTbjSF3KiPQ0gf6TAdFhC+s=;
        b=RGP25Fx/+3ABI8z7PNWcmGlZejZDUxhDOkc2C+v0dwkGmcZoH5hscZ1a+yS2/hGcvl
         dssgLFWAunZ/g1Ukk7Q1YAHWuuB3JaKI5KNvke23z7NTfQr2BsNOyYy9B+06/kRxtsOU
         LJbFyH01xrVDm1Aw6+x8fcVyIg44lZbdKYqDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771265491; x=1771870291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+a1WmFTmtt2HmepX4bGFNTbjSF3KiPQ0gf6TAdFhC+s=;
        b=kdhmJVulSI0LuN1GJ/Aib5M7AdrmO71f/xoKrL2xaiWT9IiZyQALZlnzHGbzk97pvH
         YJJwgmK6YiyRlbVGvxAnjJDA5u4yHbAgN3QejNPdgzfOoUlrBYjk7b72KeO/t+7/TbuH
         5c+O2e2s/u+VBPpx83jmWZYxsctWFzvZHMmJZXRfjqd0GF/E4Noac0gfQ/u1xryjeoKc
         SMVPq2Nad0yMdlen05edg2ScAY7/1LS6/HrasoFRIlEuv4cJneVdJ47dY9ENbWL51WZj
         DyI9JizBxs8TNRFzlujvDLBlXC+2QyYV1jWJtQdj5EIJzbIu0Ehded2VyO0ksTlfQ9Gc
         E/Jw==
X-Forwarded-Encrypted: i=1; AJvYcCXOIECYo/p44Jx76OFJhIiDJ7HMk0ck7taGcTEVcudXRNd1FKDKuZtKpK5zvyhuLzWNgp0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzqUPmvsFta77HKUfKwq/CTxp4ciYrsRbfJ8x2Bp6IwpSrq0znq
	+AUh/DwLqJ9drN7zqQxPn23mNXLs32+2u+EGUYgdJPQ5aDGy5UOVfT8hNEvo4j1r+A==
X-Gm-Gg: AZuq6aLm0XGxIOFDm4FS1wF//10cMclWg9f0cIDB0jLd4BVFWQFpN5v9q/f6q5qY/Jt
	mgtKkyYlQSOHkxKhaaTeNmDD7tkgPk/LhnJjDkJEQHi6rLe2Gsm3dAxEZHNhyGpVcJGWk1ayhs5
	dKjJDVAT/2htLDzHCDXwIXLxRXhzD5zlNzdqmd5L3RgCQ8E/yZkFUXVI5V3e2HvCoZspZgxdkIM
	v5Qm1kSVrgzQJ0wHlsothctFKu6J+iQa2pKS6npGrQ9IWKIVuxJJqd/EpYydMpSyMPQ+4/SjhnT
	kqAa25Lr+gxn/l286w46jPCybXDQ4D0MiOIB2mV3FXBvN1h9JjqTouLDWOvIRpY+c4PryOEf6oY
	qi4yPYtNdeQD5zm2ijF5chZRDWI+kxkoyQxF97Z05O3zD8kyR6OajnmpKNLVul7/HejdQFtPtIV
	t3cQ599K8TahEdtcetmUWb4VtDOFL1zqhiW+09CIUi/ZDS1eWy3df1mKr/eUY1VhHc4rkaJFvOR
	4kRdDMpwBM=
X-Received: by 2002:a05:7022:f102:b0:11b:9386:a389 with SMTP id a92af1059eb24-1273ae68bcdmr2539975c88.44.1771265490556;
        Mon, 16 Feb 2026 10:11:30 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:2953:dae1:1e39:73b3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742c64282sm13724326c88.5.2026.02.16.10.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 10:11:29 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: jassisinghbrar@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Frank.Li@nxp.com,
	Sascha Hauer <s.hauer@pengutronix.de>,
	festevam@gmail.com,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/15] firmware: imx-dsp: Use mbox_ring_doorbell() instead of NULL message
Date: Mon, 16 Feb 2026 10:09:41 -0800
Message-ID: <20260216100943.v3.4.I4a571bdd344dfe8e819cfcba37ccd0ec29284e49@changeid>
X-Mailer: git-send-email 2.53.0.273.g2a3d683680-goog
In-Reply-To: <20260216181002.3475421-1-dianders@chromium.org>
References: <20260216181002.3475421-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per the patch ("mailbox: Deprecate NULL mbox messages; Introduce
mbox_ring_doorbell()"), we want to switch all users of NULL mailbox
messages to use mbox_ring_doorbell().

This client only ever sent NULL messages, so the transition is
straightforward.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/firmware/imx/imx-dsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/imx/imx-dsp.c b/drivers/firmware/imx/imx-dsp.c
index ed79e823157a..231e9f841226 100644
--- a/drivers/firmware/imx/imx-dsp.c
+++ b/drivers/firmware/imx/imx-dsp.c
@@ -30,7 +30,7 @@ int imx_dsp_ring_doorbell(struct imx_dsp_ipc *ipc, unsigned int idx)
 		return -EINVAL;
 
 	dsp_chan = &ipc->chans[idx];
-	ret = mbox_send_message(dsp_chan->ch, NULL);
+	ret = mbox_ring_doorbell(dsp_chan->ch);
 	if (ret < 0)
 		return ret;
 
-- 
2.53.0.273.g2a3d683680-goog

