Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAAA375F7D
	for <imx@lists.linux.dev>; Sun, 15 Mar 2026 17:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773595519; cv=none; b=fmeZoopBuDRjy+5fByorId1TvHyI32GPP9UEQ7J8hcX/x+EOX4xsk0g6fQjx58s2DfMlR1ikKH1rB+MK2cRvap+4P6Zcsnz+v7gf6ywn3GBoBXk7DxBbGNfkOxl9EEnKv/CGN6vWvu3RbVq2wXzOiJtBxMcgq0Q9zGbRZWLqU1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773595519; c=relaxed/simple;
	bh=xR1aQtJyjOGsb3F8bKi8GxD9ZWQvMlCBKAMwTQealv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YNdakRhuLtcEAeEbARP7xP5kscXDle2mqT1AZClif6SGt1sEs32fbO0eNh7iw+shLPQwLjNcwP5XMauWQO10AuLNkaDb+DnXHAe+3tTS3PYceBPwihBBsdsPUutVJFHmLDGRrk6X+W1+g/t47aNUT1ksqlbOCRQfxBpan+PS+24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FRbAtasn; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FRbAtasn"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439bc14dcf4so3458086f8f.1
        for <imx@lists.linux.dev>; Sun, 15 Mar 2026 10:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773595516; x=1774200316; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2eNrBLnJJHbmPI7WkNJ6vq9A1HMj64DfR2iaRW7E89k=;
        b=FRbAtasnFCUTG3t/jmFthhwH6H67xErnqTaGFRnozBsMNTmBzZDAE3FcKa7XmVQtr1
         TFFX8LG76+SCvYfLE+9KJanY+jIuNjtqiwnYSx3XH8PeWd3E3yUKHWbVHdUXzC9soKFf
         HjEI+ukPifncPBnBrhYAXfrMfupfIWLip7q1domgVGJHeQ++FbvcnaD4uIdtEZ0TKiW8
         p22U2yvM+KNpGcbY5653svmSu4Pp1ExqNmKA1S23bctiKknzVLN3gEIihIWff/tRQ5SE
         iWR92EXKaqof4AvTfeqAjRmlIMWLG8WdNmpzAzQfQHLty2fQOf5DU/kY/UHqHVYESI/j
         7UJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773595516; x=1774200316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2eNrBLnJJHbmPI7WkNJ6vq9A1HMj64DfR2iaRW7E89k=;
        b=Hh+s0U4Ju8Q4z5n+QfFgRf5mz5LwJKj7DOjCYdETlSjxTJ7IRBlNR45Hy5Oh5/VOm6
         iTPF5WSZYu0JM6HgeUD/hm3R9IlwbcqjrZLsgTmBgI7k6USF6f9rjkSAHecDRRtxp7Xk
         AbXZIJ2mkW4j4K6Y5zMBDIYe4sXQPUIkzHRHDl+kdLzSQ0yGzK2ylFmHv3MQSjzLFra0
         5j0CZ2ea//2iVfW05MpvzJoOKRmqb5m0WyNfhqZgdu81f7uL5UAennqIhGg2cRHsy95c
         OTtYzrLT6Xbn6agK9QouxOv3WI0qkEStB7p+kU1lPOAEXLkazywa6nHusNUriA00Fj87
         pLEA==
X-Forwarded-Encrypted: i=1; AJvYcCWkGYHlIrCpaLd1NnWmkd1Ljl5SIkY9cBBWLsych1v/Pb0pPfqoBJrs5Ep6PQDUDCX9Y2A=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7MSux4pc8HgWlnisaWg6gzq8gVOR1flNvyLRDFwIFukRXeAo7
	vqR8DQQ651dswQDgV25Ief3H4Mjq5eWV4chjWAEwiDy9gBEFR/4KWsto
X-Gm-Gg: ATEYQzz0EMwm/C8YC4ISiBqln+Flmnd2VGbU7l5gvC97kGnS3LZ/Mqq4tsIEU3fZmw/
	XheRMJ7C+Cj3Ii4+jddBR7txzf4WzveqnQzHRXyfWk6o5kl80OJo0EqDPISwXFCuNxdmzs8WZ4v
	EgLtShRv+oPOy2L/sJOGDF1WICCnyaXOFtQsHBlo04u84rUdBpeEdJ338PgIbIMCs1YCMcdFIFt
	yW9NX29Z0djySO0D7noOIWH1Bcp7FOuTU9e+andRKroIgL5cdiw66glIr62x8NS8iC5YWKJbCPW
	FMi8CiKylkdNuMtg20/0RtEVAENc9raYsFOMDeYT7UIitdv8nTn6NLvApF7hNWedewL5o9lscDt
	ZRLTS6jPWbLm3Xr7X+zKgyc9dF+Ea714cCTJXJdKviYCTnYlk43Bhn6REG/rfhECpYW84fUZByS
	1SYxcNPD38k/EoNV/kffInfWqPNR0L8MI3xDY=
X-Received: by 2002:a05:600c:8b28:b0:485:3c11:de84 with SMTP id 5b1f17b1804b1-48555b47ac7mr165571005e9.14.1773595515543;
        Sun, 15 Mar 2026 10:25:15 -0700 (PDT)
Received: from debian.lan ([171.22.84.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aa73easm457168325e9.3.2026.03.15.10.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 10:25:15 -0700 (PDT)
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
	Adrian Garcia Cicuelo <adriangarciacicuelo@gmail.com>
Subject: [PATCH v2 1/3] wifi: iwlwifi: pcie: optimize MSI-X interrupt affinity
Date: Sun, 15 Mar 2026 18:25:05 +0100
Message-ID: <20260315172507.270480-2-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260315172507.270480-1-adriangarciacasado42@gmail.com>
References: <20260315172507.270480-1-adriangarciacasado42@gmail.com>
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

