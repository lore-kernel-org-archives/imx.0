Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CC243F4AD
	for <imx@lists.linux.dev>; Fri,  9 Oct 2026 12:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791548401; cv=none; b=iaKNzTyQ0F308x37AZmigAA16XaaqT0tGguNbpaNxL5IpWMuuI8DECtILcKk1TbWvatc2Q/ZFC1GwP+HBBW9OONVDdFYy3dJgegGd/rc6vRux0lod4sHNRCSK+p5lyW1v8uF+vRWnVcySfWUD37y+o30MTFf5GawPCCkUt2SReI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791548401; c=relaxed/simple;
	bh=CzpLtfkGGwXrRiqJRcGIpPqye67qSq4ze3YOpFxTn9M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fqDKEa0jEGjngM/ShEMT3fhA+V0Qy4YXT/ZF9vLJidJ1MHuBAB+QiOJErW7r+6yXkd6NhEpoHr8XtmcHGAmla6aQNOtZNA/tSZfEV2T6th19qcJb/DAYeBi5ZyP/WMrTybdXMDf1I2vlld0YmYEvLPfy8kqWdvPZ/+FgGINu9c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DBD5QjUK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aqwt5x9V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DBD5QjUK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aqwt5x9V"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KDPo2257124
	for <imx@lists.linux.dev>; Fri, 9 Oct 2026 12:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mBrbuKgt+Ksrs8OD0jodhFSOayu6IsdycZC
	AqvixHQE=; b=DBD5QjUK1KbsiWam97SpZYY6vSLDPASbYZv5wXijvxfgZtBzfvA
	K6SEs8M664o+OvY01QfwtnmUfd1dpAEzIUxosBAFWzZmRB1yHuD/IoOAbcxi2Ouq
	6EeK4AcfrRV8l87XL6VZN5e1hO1lARJ94RbR44Pq0ameL7GV243i8F28+XvMrX2a
	HF1hUd9LwPKu/Ex1CAbxBrL0Nhv0oXICeW6jgWZ4a2M8211TrJ8LjAR6TKt7VdMq
	TsopKswppescV2N9nBbXAKf5XrAumhWzTKzXVBJbmXkrtnAdlp2yu+wJzVRWxi+v
	g8qyp5wea6zAhfNBR20Qflq5H80HBtcD2mg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6nuft95g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 09 Oct 2026 12:19:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e834ff4d0so1291829185a.3
        for <imx@lists.linux.dev>; Fri, 09 Oct 2026 05:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791548390; x=1792153190; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mBrbuKgt+Ksrs8OD0jodhFSOayu6IsdycZCAqvixHQE=;
        b=aqwt5x9VkLfoZLO5A96VTWhrfIkJrLi6/HbOg4hh3CCMzzSyHdeSnfQ52zMxF5fRWn
         RBcUXEcUBcHr/SLtvuXWSo0Y42N/tIOBdnf1sMaEnmjvIgkPJBs3fh2DcEzoXhmx0jjj
         MPCAz2rDer+MUF7T1tZFQ1LXwKAMkxhHGfQ/Rdhjbj0zjODmCrdzLFDG6dGZtYSedm6V
         JHsI3jLXAbxWYULef6sJpzF6HaRTASSAf1NaQelRIJB5Bj8Zo4tbus7v0GSQ2HwwwcO1
         Ywjnil11bxVDwuicV8MdIJqmkZIwRqlW/0vF2QT/+p4mta5RBYxg3dN+ZI03QVUTj477
         R6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791548390; x=1792153190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mBrbuKgt+Ksrs8OD0jodhFSOayu6IsdycZCAqvixHQE=;
        b=n7cqEq2OJsnVxuFT/ZEwY2/D6ZDNyCZEnGoBFS0G9jJU5af3+SH2dBFDYcRfzG4mgJ
         FMHkxlE/0HgDkdbJmf8ekab3H/asEtFao2zXQnnL2vsjWh2m5LgpTqkyonmFFp1yGgcc
         zzn7sh91ofU8lRRxnqaOpRUk/kYfzXKCkYPnByPDnCcNYi9/+vWxXzpP6TJhczQ2LAZO
         k57BydNE1xMV6BuVw78SCgohyUfMCDMhngT+0Hwy151o7P7foowySGSv511OYR1y9L6O
         XN8YeOxNBOXNiYO2OFK5GQOmOFDcTUYGQcV12d3nnUIU7TQQDXVThmweqI+Np5Zjy/MP
         PABg==
X-Gm-Message-State: AFuF++lwMpnLxY06iy4jasNyThUW9ax7rbZDxkt57nsg1Sie4UoWQHRt
	KqpdoU5DvukMuUym8m6b4jWTCxOJQX8+vwXpOXGDQATWqxMjlhmcAgbFdwzXCVEpIq0IXwpSZRT
	sWxJhP69TvmS2PVmISex+PBRH1P/puhfmGN6vDfVzeTILPZ8Nw7wyhjs=
X-Gm-Gg: AYBFou0uCSuNXCtS1NZewbMTNlU1qP4fNQlZkGHr4Hqvufz22XuligqG5Big73/xa4K
	JtYiAjJqOIYZ1880pQUlZo1FY5DeYGc/o6lT64w/9j2TBeNuGKLGLafMthUz3LiIqivqnmLzneJ
	c9K32CUNzNQeACIyxCgBMnfrqclZp7j1b6UfdiIl1Y+bn9CazRiD3YL/4XwCjTwfr/kLuwgevfi
	m8mwmjYWx8APxeKl0uGPl5UrY+WjsfdPjTxduVuucabgf89wcmZPTPnyQOArlPSCC18YACBjDsu
	kQbHWYkmW17VeSSM1PegfgmIzu/OsIlop+O8Rj2bCrIwChUoWa+m//RAb/hm/ptpgyX/aHZ3bXu
	PLFyeb2275QKq/tdXGsfwhR/+Uvg=
X-Received: by 2002:a05:620a:6306:20b0:93e:c12c:fbc5 with SMTP id af79cd13be357-93ec12d0793mr98792785a.82.1791548390250;
        Fri, 09 Oct 2026 05:19:50 -0700 (PDT)
X-Received: by 2002:a05:620a:6306:20b0:93e:c12c:fbc5 with SMTP id af79cd13be357-93ec12d0793mr98788785a.82.1791548389566;
        Fri, 09 Oct 2026 05:19:49 -0700 (PDT)
Received: from hackbox.tail37bb1b.ts.net ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e481993sm40485285e9.2.2026.10.09.05.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 05:19:48 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev, NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] clk: imx: Updates for v7.4
Date: Fri,  9 Oct 2026 15:19:36 +0300
Message-ID: <20261009121936.1882361-1-abel.vesa@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=afn0Dhot c=1 sm=1 tr=0 ts=6ac8dbe8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=dMgMsFW6-PjHuSmHTgUA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0OSBTYWx0ZWRfX8Nto487+QPvO
 u/FN2iJsEbqSF6otIychRII6nZHrz2xSutBavJP3BPnoIDm8ilBYEM2gmyXGXMZeLPg0vgqwUDK
 ePz+plRb/+cIsRGwqdxbsxXsextX0eU=
X-Proofpoint-GUID: HEwzzzeTFKKdI2wtgsKU4xx5A2jN5dlt
X-Proofpoint-ORIG-GUID: HEwzzzeTFKKdI2wtgsKU4xx5A2jN5dlt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0OSBTYWx0ZWRfX+jxrkK3EQ227
 PvqvbN5k3WNxV5DXyvGT/aLywqwIukTwtdowx2PX7Jf4LFmkZW9u51uLZnr1ko3ZFGdUumrG7dP
 xftDs6fioThOz8wwd8MkMk7dXh/Zphp84jvH4D/DY2SDEtngLNdZM+LLpGykFp4jzxXqzWifMRM
 UfzSVZCwCjj1ICEkjfjGQk1rHpVYPq3lk5ZCa8wrut7V/lof8B5yrcmm9tAKXhCMJcoU+7JGpq+
 fSSsFLLKRz6HSjDfBSPAx67ffuoU1CCfjb6raqqNqujtaUYP3VZfNm8PkxDAz2DngFKjm9uZKng
 f0zz/Nyy8tT1WP3+ynaBqgZC67kRgpXHP9KpCvR6DH0SHVukB3LufhX4112L7aIZE0JzcetCKgn
 suJqep8c4L/WFJ4mfst9HIoMzUDmEFcOEi+tLjProtxygGqNJ0gnz3mmdY6NYDhz/tjvZI0nyvD
 bdZDxc8qPJMwC06yetA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090049

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/clk-imx-7.4

for you to fetch changes up to 52d4d1b26a5bc64de95099d0a3dd8b90dba1f3a3:

  clk: imx: Fix clock reference leak in imx_obtain_fixed_clock_hw() (2026-10-09 10:55:51 +0300)

----------------------------------------------------------------
i.MX clock changes for 7.4

- Propagate busy timeout errors from i.MX93 composite gate enable.
- Add 350 MHz support to the fractional-N General-Purpose PLL for
  i.MX93 display use cases.
- Fix clock reference leaks in imx_get_clk_hw_by_name() and
  imx_obtain_fixed_clock_hw().

----------------------------------------------------------------
Linkai Gong (1):
      clk: imx: composite-93: return timeout from gate enable

Mikhail Vaniulin (1):
      clk: imx: fracn-gppll: Add 350 MHz support

Wentao Liang (2):
      clk: imx: Fix clock reference leak in imx_get_clk_hw_by_name()
      clk: imx: Fix clock reference leak in imx_obtain_fixed_clock_hw()

 drivers/clk/imx/clk-composite-93.c | 11 ++++++-----
 drivers/clk/imx/clk-fracn-gppll.c  |  1 +
 drivers/clk/imx/clk.c              | 15 ++++++++++++---
 3 files changed, 19 insertions(+), 8 deletions(-)
