Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2624E374E67
	for <imx@lists.linux.dev>; Sun, 15 Mar 2026 17:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773595025; cv=none; b=Ejza+DA6fI7hnXKsMvwJQlcK58PuUiFxszBbPsDKNXUOe0tC2W/mwm6o+77qOYfI0LwTnPP6AFE3Q85uWamxsf1PyRXv9I0WZIlJwSkt/Wtlf3D6oNJHlRhzJO0uiGvsKK7wc9mU5BGzaxEN8Ro9Jjdg7tvE0wvhznpLFmrDZCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773595025; c=relaxed/simple;
	bh=xR1aQtJyjOGsb3F8bKi8GxD9ZWQvMlCBKAMwTQealv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jIIppemsr0YoF+akEeZzsNrHWPsenBG2FTQ58/saxUVr777knU0YZF0FLBbsPjxmJRoyOJqPjQTScpcjGDoQVBz/Q4T36m0bTVjzVWr+Pq2iSmsggFJ0QbJrcphzcaOQB7X6gWqOVCjO2qZlftKnDUUXk9VLTLqhvAYHAtDAUW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lsMrvlQ1; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lsMrvlQ1"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439c5b40f60so2949614f8f.0
        for <imx@lists.linux.dev>; Sun, 15 Mar 2026 10:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773595022; x=1774199822; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2eNrBLnJJHbmPI7WkNJ6vq9A1HMj64DfR2iaRW7E89k=;
        b=lsMrvlQ1N8noQYU7Pzv2+zk7/3N1DLcEvu9E7CoqheQj2pqW1d+ibibdww4JYJqkZG
         Xf0+9gxQ/lU1OJw/t7QnA1gEtDib8c/pz7frmGwBydjwGL7kAQltEMDbFZIc5HvGMFHF
         UU9RkY4CkaUrWd1rmxSLJA5OwpNvyupcCG8heqcLX7U7jfTUdPg75I6QND0HzLqrEes9
         GlIU2od2QAsWv+Xf+Q0oLj/3GfbRTyo8+oSbPo6WslhwgwQTmTUsQZXa0fpP9XMNEYx3
         TH4sMuy0OugipNO1+F1H0qDfVWc+Wo/Vfw+Tc39MrfuB/JFm3EkWc4jUe3Xsa6/Xx31y
         5usA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773595022; x=1774199822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2eNrBLnJJHbmPI7WkNJ6vq9A1HMj64DfR2iaRW7E89k=;
        b=fD0Ki9KPXpxTogepV6DDkTAjDBrStrg9ZogSEvkJ+2GEHVGwH3J3VZ1gh4c4w15kmz
         RmSPSr7cuTW/tOiKOYihKtSjOZklHow3Xw1nqy6q21l+h7/UpkwSvaRSH2INt4ysCyE4
         aNZQf3pG5MscTjYr2HyL68lZ9MEzsog9uC3K4d3TmmUmvO4J0Xz0TlyMVk3IVsOR2BMQ
         67b1Ds85XxqxojFkxV4xai7jTZvARHi2DyZYEtPeugI03yIP1RZCvFoJN6XXd1wQeeh7
         aqJpzF29bB8teM6dXwXGcb2NRfuZFYj/oQbQ2I0h7BA/2xt6c/yXhBhNhXl1mIf55YYa
         rd3A==
X-Forwarded-Encrypted: i=1; AJvYcCUzivV7fhApx5CS4DrHkdDcM3OL/EZ5F0YpchvlFHjQxL2jJFjVFfwmU2pPxZTf+1d51tY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyirvCKYNWAOWn2FUuWkqXQLaON4veaDsWcMKYcmHrdv1DDtg5a
	4IIL2FqxyMhornMDRX1lKZn1VXk/5H5EQqMqgBZl76ICmAB47ybjn7cD
X-Gm-Gg: ATEYQzxS2rDkH0GcVDMlBuKWlx/nQvE/AbRRoEhJM6vW4CioSpOEbIEgH+Ijt261Ofq
	8dr4yPQndnv/YJBoThw/c9kzVhIA3awzzp30rpDTYuD/P+r9slY6fuJStaNcyxlqczk0gMfyI83
	3a1mhK3aDJEVUIRnolFrVKo74JOOQuK40QyYauIM83KSXmvS+vom2AaCxSMVaV4dMjeOM2Kndgi
	zWQkgYaNza9b62i+6c1SeEUrpgQ/MCwxj6h45pLkd74etznb43YyLAIYXSkKns978XgR5Dyjl+m
	PhxFskVGjfodJyvOEJvzpZ4X1QoLPs+XszZGlMaRG0I7wtSDx/dph/ObXoFhCUszHL16xiGq5hb
	hqEZ3WVfKaYsnXaHM5nxaGj1Z4CIRpHttHc6A1AjAo9TWNqftyasthmt7Rj5T6Nl9BTfPX4dL6k
	21wO4nWpxFfiAlsRoA7qGhglkjOxsgqu/NMw==
X-Received: by 2002:a5d:5849:0:b0:439:af0e:57a8 with SMTP id ffacd0b85a97d-43a04db7edfmr19896954f8f.33.1773595022342;
        Sun, 15 Mar 2026 10:17:02 -0700 (PDT)
Received: from debian.lan ([171.22.84.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe21b631sm40536429f8f.27.2026.03.15.10.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 10:17:01 -0700 (PDT)
From: Adrian Garcia Cicuelo <adriangarciacasado42@gmail.com>
X-Google-Original-From: Adrian Garcia Cicuelo <adriangarciacicuelo@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Boqun Feng <boqun@kernel.org>,
	linux-mmc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adrian Garcia Cicuelo <adriangarciacicuelo@gmail.com>
Subject: [PATCH v2 3/3] wifi: iwlwifi: pcie: optimize MSI-X interrupt affinity
Date: Sun, 15 Mar 2026 18:16:52 +0100
Message-ID: <20260315171652.269020-4-adriangarciacicuelo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260315171652.269020-1-adriangarciacicuelo@gmail.com>
References: <20260315171652.269020-1-adriangarciacicuelo@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement a balanced RSS queue distribution by skipping CPU0 for
high-rate MSI-X interrupts when multiple CPUs are online. This reduces
contention with system housekeeping tasks on the boot core and improves
overall throughput.

Signed-off-by: Adrian Garcia Cicuelo <adriangarciacicuelo@gmail.com>
---
 drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c b/drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c
index 4560d92d7..87149f29e 100644
--- a/drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c
@@ -1683,7 +1683,17 @@ static void iwl_pcie_irq_set_affinity(struct iwl_trans *trans,
 		 * Get the cpu prior to the place to search
 		 * (i.e. return will be > i - 1).
 		 */
+		/*
+		 * Balanced distribution: skip CPU0 for high-rate RSS queues
+		 * to avoid contention with system housekeeping.
+		 */
 		cpu = cpumask_next(i - offset, cpu_online_mask);
+		if (cpu >= nr_cpu_ids)
+			cpu = cpumask_first(cpu_online_mask);
+
+		if (cpu == 0 && num_online_cpus() > 1)
+			cpu = cpumask_next(0, cpu_online_mask);
+
 		cpumask_set_cpu(cpu, &trans_pcie->affinity_mask[i]);
 		ret = irq_set_affinity_hint(trans_pcie->msix_entries[i].vector,
 					    &trans_pcie->affinity_mask[i]);
-- 
2.47.3

