Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104150;
	b=i3fv3g0CsmQJzkzi+T7yaIx5Tw0vtIZ+Gmp65mTehUPJovh57Lq6R6l5qlsI6bIvX9jv
	 U5bFzgTkaELEGwMXUSiNLk18OVzX4v8S3joAZqTYSn6bc9Qy7Q4O6mlyfH3fxAn97olr+
	 OKBdY83nIET5SyaCRcbqTow8B9HQtqiQedX3x0JOrZJ68fkToI1Uan77nwwIS8kXjEOnW
	 1wXDjPHfhdFFlsyqBQR9XWkHDdyHHvQ0CM/bue12enPg9vPGBMx+PGLP+R9KnCA0+uUB6
	 en0SGd5OcP94p0F1deqvKLEvl9ziPTrOkqSlHTr1SvjSJ9r6kVPpXkOhlHf5KrRGkGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104150;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=EsBtfIr5EUXQ3qF7d6IMuBZrNqiq4pV3HY493jPff14=;
	b=uP8YrqWDkh2TLD5x/5dGY7cy+WAFZlXRiwZ2T/d1qDNrgvEhBNnQgfUAsn95P0WQwWIg
	 O5iq1ZKs2n5ka3zPwIfLVGJd6GdwlxJgKii7hBtyjDFvDItxRYFPp2zFTo0M/yWaR5zCn
	 57swzBYJZttM6WV+Yroa2AU2z3QYGZjqqNfXYmbY925EEFr9UlguEXt8vfmG8Fhk4nvbA
	 gSoC4zGbE3jkZA+RDYdBibzskBesqqH3nUNZO/q5i8X4cIxfHEtbnoIvB76wNcR6RsNsW
	 FfIp713sreN3+LSVY4HtKPgZ+kToXfUBP5quzPivoIM9UB802iNIAEmWcVivkVmuGQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=m351pkzC;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5BF606A32C;
	Tue, 27 Oct 2026 12:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD5BF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=m351pkzC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Es
	BtfIr5EUXQ3qF7d6IMuBZrNqiq4pV3HY493jPff14=; b=m351pkzCgssz/DX0pY
	xpsMvLCUrrSPCcOs3tWTUl5KcRaXs23UG/WLDZoevmyBmCf503yCpxGvEdCdOmng
	I04rmsLBgcj9RXWsac6py8GSg670JVKuSbhZK3OD8fifMh/KwALDzYrh17+DL2fo
	QOh1tOkJJjOCSAL1lxIzVcKFk=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDnz2v5mOBqYaUSDA--.46182S5;
	Tue, 27 Oct 2026 20:28:45 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	jingoohan1@gmail.com
Cc: imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v4 11/16] PCI: dwc: qcom: Use cached PCIe capability offset
Date: Tue, 27 Oct 2026 20:28:22 +0800
Message-ID: <20261027122827.2725643-12-18255117159@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027122827.2725643-1-18255117159@163.com>
References: <20261027122827.2725643-1-18255117159@163.com>
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
X-CM-TRANSID:_____wDnz2v5mOBqYaUSDA--.46182S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxZryxKryxKw17Xr4ktryfXrb_yoW5KFyUp3
	yYvFn0kFn8JrZ7Wrn2yFZ3Xr1avrn8ArW7AayxK34aqFy3tryUGa1jyrySyFn3CFZ2kFy7
	Gr1jqr1UW3Z5Ar7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziyCJ9UUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6x0422rgmP0ZsgAA3R

Convert the dw_pcie_find_capability(pci, PCI_CAP_ID_EXP) users in the
Qualcomm host driver to dw_pcie_get_pcie_cap():

  qcom_pcie_clear_aspm_l0s()
  qcom_pcie_set_slot_cap()
  qcom_pcie_post_init_2_3_3()
  qcom_pcie_post_init_2_9_0()
  qcom_pcie_link_up()
  qcom_pcie_icc_opp_update()

Note that the .post_init callbacks of struct qcom_pcie_ops run from
qcom_pcie_host_init() before qcom_pcie_clear_aspm_l0s(), so relying on
that function to populate the cache would have left the offset
uninitialized for them. Doing the lazy lookup inside each function
makes the ordering irrelevant: the capability is searched exactly where
the register is accessed, i.e. where the open coded
dw_pcie_find_capability() call used to be, and every one of these paths
runs after qcom_pcie_init_*() has enabled clocks, resets and power.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index b58a607b713f..cec36c989a88 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -359,13 +359,13 @@ static int qcom_pcie_start_link(struct dw_pcie *pci)
 static void qcom_pcie_clear_aspm_l0s(struct dw_pcie *pci)
 {
 	struct qcom_pcie *pcie = to_qcom_pcie(pci);
-	u16 offset;
+	u8 offset;
 	u32 val;
 
 	if (!pcie->cfg->no_l0s)
 		return;
 
-	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	offset = dw_pcie_get_pcie_cap(pci);
 
 	dw_pcie_dbi_ro_wr_en(pci);
 
@@ -378,7 +378,7 @@ static void qcom_pcie_clear_aspm_l0s(struct dw_pcie *pci)
 
 static void qcom_pcie_set_slot_cap(struct dw_pcie *pci)
 {
-	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	u8 offset = dw_pcie_get_pcie_cap(pci);
 	u32 val;
 
 	dw_pcie_dbi_ro_wr_en(pci);
@@ -959,7 +959,7 @@ static int qcom_pcie_init_2_3_3(struct qcom_pcie *pcie)
 static int qcom_pcie_post_init_2_3_3(struct qcom_pcie *pcie)
 {
 	struct dw_pcie *pci = pcie->pci;
-	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	u8 offset = dw_pcie_get_pcie_cap(pci);
 	u32 val;
 
 	/* Force PHY out of lowest power state */
@@ -1281,7 +1281,7 @@ static int qcom_pcie_init_2_9_0(struct qcom_pcie *pcie)
 static int qcom_pcie_post_init_2_9_0(struct qcom_pcie *pcie)
 {
 	struct dw_pcie *pci = pcie->pci;
-	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	u8 offset = dw_pcie_get_pcie_cap(pci);
 	u32 val;
 	int i;
 
@@ -1327,7 +1327,7 @@ static int qcom_pcie_post_init_2_9_0(struct qcom_pcie *pcie)
 
 static bool qcom_pcie_link_up(struct dw_pcie *pci)
 {
-	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	u8 offset = dw_pcie_get_pcie_cap(pci);
 	u16 val = readw(pci->dbi_base + offset + PCI_EXP_LNKSTA);
 
 	return val & PCI_EXP_LNKSTA_DLLLA;
@@ -1690,14 +1690,15 @@ static int qcom_pcie_icc_init(struct qcom_pcie *pcie)
 
 static void qcom_pcie_icc_opp_update(struct qcom_pcie *pcie)
 {
-	u32 offset, status, width, speed;
+	u8 offset;
+	u32 status, width, speed;
 	struct dw_pcie *pci = pcie->pci;
 	struct dev_pm_opp_key key = {};
 	unsigned long freq_kbps;
 	struct dev_pm_opp *opp;
 	int ret, freq_mbps;
 
-	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	offset = dw_pcie_get_pcie_cap(pci);
 	status = readw(pci->dbi_base + offset + PCI_EXP_LNKSTA);
 
 	/* Only update constraints if link is up. */
-- 
2.43.0

