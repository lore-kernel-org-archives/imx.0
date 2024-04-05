Received: from e3i57.smtp2go.com (e3i57.smtp2go.com [158.120.84.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7709E16FF54
	for <imx@lists.linux.dev>; Fri,  5 Apr 2024 15:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.84.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712330959; cv=none; b=cLqg9nmdLrvGFbOh4eeKL5XkMkU6q1Fe6c/X93X69leruABMNfOdHstlnBgZbFhrjap/psr8bUEizKUjGMnxpKQtrXgm9dcT+T2RXhnOHWpfJlZMTQ8mfc4yoxp5o+wb+EvjbSNGK5Td54KbRgFv0Lv2TbmjDzjTNNpn6YeAQM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712330959; c=relaxed/simple;
	bh=B/Y9KFHnGrgSCyRy0/AylRmUryM/Ly5WlXGcNe5R6y8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cBiYI5Qh/k1sUNT6e/2Xjt8IPF2zpUHBt5UBKcTIMd3wWfl4GvFtMaqFSXEGXd4Ra83EdLRewei8DgOj/7GDs45lHBpDzH/TeJErChsKxpzwPRI5pzGio/AJh8+YGFiRQioe8PX1CrwvA5ScjenrvZXJFjf6YWvbx37PfYoy3XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asem.it; spf=pass smtp.mailfrom=em1174574.asem.it; dkim=pass (2048-bit key) header.d=smtpcorp.com header.i=@smtpcorp.com header.b=pd1vrp8x; dkim=pass (2048-bit key) header.d=asem.it header.i=@asem.it header.b=DFb6loE9; arc=none smtp.client-ip=158.120.84.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asem.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174574.asem.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpcorp.com header.i=@smtpcorp.com header.b="pd1vrp8x";
	dkim=pass (2048-bit key) header.d=asem.it header.i=@asem.it header.b="DFb6loE9"
Received: from [10.86.249.198] (helo=asas054.asem.intra)
	by smtpcorp.com with esmtpa (Exim 4.96.1-S2G)
	(envelope-from <f.suligoi@asem.it>)
	id 1rslVA-ynZKb9-1a
	for imx@lists.linux.dev;
	Fri, 05 Apr 2024 15:29:12 +0000
Received: from flavio-x.asem.intra ([172.16.18.47]) by asas054.asem.intra with Microsoft SMTPSVC(10.0.14393.4169);
	 Fri, 5 Apr 2024 17:29:01 +0200
From: Flavio Suligoi <f.suligoi@asem.it>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Flavio Suligoi <f.suligoi@asem.it>
Subject: [PATCH 5/6] arm64: dts: qcom: sa8540p-ride: remove tx-sched-sp property
Date: Fri,  5 Apr 2024 17:27:59 +0200
Message-Id: <20240405152800.638461-6-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240405152800.638461-1-f.suligoi@asem.it>
References: <20240405152800.638461-1-f.suligoi@asem.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 05 Apr 2024 15:29:01.0719 (UTC) FILETIME=[FC6F5270:01DA876D]
X-smtpcorp-track: 1rs_VjynZKP91a.EuMJjfTXS-5Ws
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpcorp.com;
 i=@smtpcorp.com; q=dns/txt; s=a1-4; t=1712330955; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe;
 bh=6HGwCVZ1ZliNjksUiz6WB6FukgOBYyF3KdLTYEIBNkQ=;
 b=pd1vrp8xfzgYq9NRwzw5UDTD/3HFjxBXg0id4O2fiuttrdn3lSD9aLtz6R5OE6v6Qn+Dq
 KVoKt/rl96N7PLVMJJxReqLOkb1d/bVoH0ZysdVhKVydzxZlrD6xttOR4b26N8EnpJS54Bf
 UbEQK5AIyd4qUHtwGiulQsJ7MFFIAxMH7mXcMESTx/xk4bBGoZPQ55LiOlw/0LWoUE8OrmH
 kpQ+971bBYT9PbXcHoB5zztiuJkSsAh8o2JPSjQ5+3QN/cc6yndRWyJJLzyLbibQK+91ors
 rpfZ4AqdFO1aXS3H7UO9yKqD5fAze/TYEACGvitxW1JbGJO+Sp9ZW+qHCNVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it;
 i=@asem.it; q=dns/txt; s=s1174574; t=1712330955; h=from : subject : to
 : message-id : date; bh=6HGwCVZ1ZliNjksUiz6WB6FukgOBYyF3KdLTYEIBNkQ=;
 b=DFb6loE9/U6ALUOL0bxps9uFpDYWwufFsrE63id+q/eTUXMPh6cW81/TUjHECkqQSC+0E
 mIiycl13F43RzLBLq4quKrpo5GwRx3QtY2Hu9Ep7ncRwYm0mspmBSDfZabqkA0NzYSi0a0z
 80V7odGOXh3Oav7hQ2vpCGATN8ZaU+ZfdZoXAZtojJVuBZ83TvXxiXdyNlzQVTpfs8PMwFs
 8zwqIjh3bKg1rvxT3rSrrZgA6C1rPxGIfujxBLhjZRaCLyJJNWd8q9WjhCzVqSEr+3qsiHh
 IP5mcnHmBbJKvgD3QgFOzqRV7VaSlPhL4ahDqgcX/N53jMJfHg0Qwa+OzGFA==

The property "tx-sched-sp" no longer exists, as it was removed from the
file:

drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c

by the commit:

commit aed6864035b1 ("net: stmmac: platform: Delete a redundant condition
branch")

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
index 177b9dad6ff7..11663cf81e45 100644
--- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
@@ -225,7 +225,6 @@ queue3 {
 
 	ethernet0_mtl_tx_setup: tx-queues-config {
 		snps,tx-queues-to-use = <1>;
-		snps,tx-sched-sp;
 
 		queue0 {
 			snps,dcb-algorithm;
@@ -302,7 +301,6 @@ queue3 {
 
 	ethernet1_mtl_tx_setup: tx-queues-config {
 		snps,tx-queues-to-use = <1>;
-		snps,tx-sched-sp;
 
 		queue0 {
 			snps,dcb-algorithm;
-- 
2.34.1

