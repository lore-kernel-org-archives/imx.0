Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A05377576
	for <imx@lists.linux.dev>; Sun, 15 Mar 2026 17:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773595678; cv=none; b=lpl4Hp44oqvhK+DVNFvAab0h7zuw+xJw5s0gBBBVPiPSLGRXpV+5PbJlE9ivpocN/5t90Nc8a5E8FSoIENHY813sccREiX937ynik1jZrcWVL19epr0YWtWwgzaEUkKjwV+4qlhgDh+6X96Fb7+8OzeCEsJU21ImCO3qMCDntkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773595678; c=relaxed/simple;
	bh=3xFqNDbANLuxYwJZCL+0J4Zy2U0siwNrORG2I8A78Nw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lr6QGrLagv8TEeRu+HjVwFjuznnne0pItrXRA+ZOaVv4WOP5u/nHn74B4GwpsY4aQFhJ1ZcmcCAGT32OqVUBsbsE2TvN4bRv04F9nKY+rhO4tR+oL1bELC6W303WkPclUfxeGVgqJB4wp3lGK8MyzJi2d9U4FLg7SYUtr00uTJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eg2q6A6b; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eg2q6A6b"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso33628895e9.3
        for <imx@lists.linux.dev>; Sun, 15 Mar 2026 10:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773595675; x=1774200475; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBtR9VKnPKJgjfwnbtGvinYVj4EmpVw+ixE7+VzQpDU=;
        b=eg2q6A6bi3Ngv31WpvGUCOaWcIUhLNLs2JtdDnL/BwfWbSrq90cJsP6l5SxFOl3b8R
         F2WwV5nqbNY4R5Z+C8+HNHFxiXsHAXi/W4RBipMqPdtALjNT4waolAUxsUQn/pU+u7Ks
         qh9Lb3f7iOzJ3VJiGUrqwe8n6hzbOLNhTrghPPYFnfczEZKWunGEVbOn/I8/kVm1lIRL
         vu/JzxqkR3ddgI0OujqF5iUKrQ6IZ1QWLAhrRj9UqHF2XJHP/T6T1UXWikwHgqE4Zn/d
         9P8jReRV9qkihw1yqGViIKEy33ZfZJyV6YlcRhVOSox+xeIJwRufqwAL66ndu/+0mU5Q
         UNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773595675; x=1774200475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QBtR9VKnPKJgjfwnbtGvinYVj4EmpVw+ixE7+VzQpDU=;
        b=W/WDFpAq7yOVP3AbsCQWJ0KtE353/+scaO9RUkSdA7KE1QLSFeWP1iNpYdaaMDLMgL
         YQ3zVnrUMWrdp4GLdjyUgyfpAdqZ7sX6dj0+JAwNAcqXBhy2H1zuBAkNQ9tbl2ULUmze
         BwvQprD16B8zkWNHCiJ7770hioZDyQcIW4BvgbBhQUklbl0c22Tr4c10DFVC1WFf11uC
         3qXVHaRsLOsU4Enz9InY+eehw1fmU/uRnkNgZqkQ8jAgtVLf7XxsomM3mcRji/WNN+rn
         kVryaCXZYpQcl2ux51JPj6tL6ybWaSvMRaBG+/6z+wsdBrxiumuhUkgdFabdTVk9tiD7
         3Kuw==
X-Forwarded-Encrypted: i=1; AJvYcCUyDcWZMsK54zn9+cjbq6qoCpLUNn/f9Qcw3+mFRFzvaTfI/a3tYJD14FoNDpfp75wOIAM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJTg17QpfJHzRS1ugPbGbb21qme04OhpQMIDEfw2vT+ML6Mu86
	ebWgzlqaZJLSQSMquTd40lAvjoUro1VC74VPkdu+G8BfsxoxXngJooYl
X-Gm-Gg: ATEYQzwrx2GmIZZAGZNbDjm3vVh0MvhjcU/+lttKiU8s1eIvBr9iQdq4X5/zMuuQTxP
	UikMWyHrlbm2+q5c2Jf76D4O9f7O5Z2ZhWJCk6wpmTpdMOoLrt3js3UGFcGPnApV0w+frQKnX7k
	S57nG73WyK5A3+mdiUBgkvw2RwNkZBKcqILr/dxpjUDV21FRRONSlizrLwPbRrZXi13B8VtvQxb
	TgOpNW+kc7wcIgGYxEKa9o3N1XAvFPD6T8bEJkdfitYkcbJLq1XVP+9CmCJpRTJTmArCG2DZvCK
	elZhhqzbvXHQdEHsj77wPaDl0ZIAGXWdsaHGGeUb4tHA4BQLnEW/N84YViTxzuWL46CBSVOboVC
	ZQ2H3nBEMMrvspZXbPzZVGz7wcAHW0NhiPNMYh4SM6SoCv1tWCjtD7hLalmics31tasPF1C26mz
	f4ch7n00Uf6V1CSw1dcqx2X0Lc7fhBEKGzrIs=
X-Received: by 2002:a05:600c:1395:b0:480:1c85:88bf with SMTP id 5b1f17b1804b1-4855670b72fmr170714095e9.27.1773595675367;
        Sun, 15 Mar 2026 10:27:55 -0700 (PDT)
Received: from debian.lan ([171.22.84.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557c6586csm73644905e9.20.2026.03.15.10.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 10:27:54 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
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
	=?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>,
	=?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacicuelo@gmail.com>
Subject: [PATCH v2 1/3] wifi: iwlwifi: pcie: optimize MSI-X interrupt affinity
Date: Sun, 15 Mar 2026 18:26:38 +0100
Message-ID: <20260315172746.270734-2-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260315172746.270734-1-adriangarciacasado42@gmail.com>
References: <20260315172746.270734-1-adriangarciacasado42@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Implement a balanced RSS queue distribution by skipping CPU0 for
high-rate MSI-X interrupts when multiple CPUs are online. This reduces
contention with system housekeeping tasks on the boot core and improves
overall throughput.

Signed-off-by: Adrián García Casado <adriangarciacicuelo@gmail.com>
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

