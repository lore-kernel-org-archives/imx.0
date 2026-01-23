Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC38326953
	for <imx@lists.linux.dev>; Fri, 23 Jan 2026 12:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769170495; cv=none; b=b2hnfTDzG8vj0D/OxawZQ8kiqMcl4b+xIbokgEXQq4QGdzTZ5++I2Ug0Eq+D+3Grmo0q2Tq0i5dXuFzG0dh16fSFIE59Cm5eXIYR1o5XzhbuSPh8KFaMyoCSwZ5RfDx2BdOw81NYOGZYOOn6g3ocTWbUJUiTfNWqfH0rx2IljOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769170495; c=relaxed/simple;
	bh=1VBKv2d4Kw/BVieQnuOG1OXfQo9tqr/j1oaUqqUaIi0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UUkiI1rggRn4g2W1Emlow9fA4rUpXs7hs6TmGPYIC6AZ4QgvtOtKRUqIh6dLLkpv2KTHqf1LM/X6L+vsPqSE3IVE0eotpwCiJnKWMS7f7wYXyhts+YvZKQQj0V45i/ZDXH6VApMgHi7SmjFq9ZsDwmcqs5DDRVZWyaFFwxcNhzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=docilZlj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bKteymk/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="docilZlj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bKteymk/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N9L3dD722676
	for <imx@lists.linux.dev>; Fri, 23 Jan 2026 12:14:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BBFlJ/LfGtg3hOzrf7Xo/5L9Tz24VTUma/0
	bRXqr9Gc=; b=docilZljk0zKm9bbHQN2nMhLSGiBiD+rt/DlMAov5D1AVQGqNXe
	TaQTUihgGA/roCInhNvD5kTHECH0ktl0mrS6djO5xcmk8UlCdjxkWfavOMQ46OmL
	NOpYolyD0yFDcZ9VO2Ye49djIz+Y1nBSg3YIAdhf7T2+haQnm2zEHTHS9c7MG4AT
	MvLMXO1lj61ajEyxCe0dOADPRKSweMwQn8Rhd/uoOMfUB2zqcmXk6BXCjUP9pOGI
	aVW7TJ+0XwgLpNRlZitSiHdZFkDngprX4dx4FSafjjH95L4eGiGlMREbAxsRmPBc
	IchHDAuYbQpzLiS/oswzyzNoO15HKeLx/sw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bv069j1uv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 23 Jan 2026 12:14:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6a0ec2496so452936485a.1
        for <imx@lists.linux.dev>; Fri, 23 Jan 2026 04:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769170492; x=1769775292; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BBFlJ/LfGtg3hOzrf7Xo/5L9Tz24VTUma/0bRXqr9Gc=;
        b=bKteymk/Q0Dj0GkrFOsZjRB0Hi+AckJkQGCc1h6YmxVCbZ8IwLf+l3S5ELWKPEPHUG
         nnQGU/zUsY8JE0gh9afV6xkXq2DWwdHDb0y3+YIT7aCiAyjSbH40OHNqwRMUyOGtIT37
         Aoo407nYYnZCVfEcyOu651QuZHMMoQd4wJqu+1ASqYVSnGu6mIYv5Pb2uEjitkTirKqv
         Rffm8MewnQcPBz5xQrNRxva1yzwbXNWXH1Uay68NJyEoMM5HnxvfCe8LHPPg0rIcoKZ8
         MydHeDXTVvKZc8Rei1L2ZmcVNQWXuCSnMvDjsgTsBVa4j0ahU+CJDGY5IPYYpfnfVoSI
         n1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769170492; x=1769775292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBFlJ/LfGtg3hOzrf7Xo/5L9Tz24VTUma/0bRXqr9Gc=;
        b=CMrZWgIjrjm12BbzeYAr1Jf0+JXF6jLF7rpX2+xWsTJtCvCL4GT1FPB69zUcfydSHg
         Iv/XCA+WJ/ItjQm6aH9UadtCjXyJpu+XqtqTbtNt1hqCZYP7/o1QdcTvnj1U8l/LGdLO
         6cZ4Y7ib363EBvLPwuUPgEns3T+TVLi9p2hi1L5oPNiGQmmMmztKkIRXDGNe1Rw3PVaT
         WTY00A+g9tmzVzhKhTcg49wcknJl+ilMQtxbFsLQYjX0VyKAhUySkR0Zg8BApEgwzNK6
         jpM4l3Y0sQKPEbLhswhtu6EF6HjTItkJK/zPwx0DryYstSLGT7632W05NM6qXSdSFs4b
         liKA==
X-Gm-Message-State: AOJu0YwZy5GmJqkTiWXjDX2kUwCnRHZBOSEmDW3+d4FvChG5cPDcax//
	fctu6lWcjH+RgItLoS2+94TxbIdETB/qNx5QkvU15wC5XXnHvHZGlmYkWzAUsa8WNK9jk6GKhq7
	lfjy2hcH/yZ0f5FIYlzE6SE2BRaP350Zip7NM/C+CUZSJhWfDj1ztrmv331BBeAWIg3yK
X-Gm-Gg: AZuq6aKgF9q9I93AdcVLwpoALV9avnhy+3x1huBk0ZZm20aOHrlRbwZcgvq7aR03A53
	pFKn9Ox7pE8nRS5jqrj0zCh6GnI2ta7nIooALHtOyUjSxJh7vDg/jKsOsPdxRMgBIc6+JeDG3gL
	FGxJvKDbGBlFI2YxEfEYIv8s93f6Sis4n2zuW8dDmXbkNNR1mtPFVDq3KhsxZ/d181VskFPz7Xn
	DpN7a1HRvuJjw1JsJBKsyfoJljQGa5OxlzF0gLOsbOcKjiyVsUazwh9Ru4L6rSlxx5tyroKtlvh
	APCjI2WICzvki9mO7LV2iuls29lt2RWr8+FJ3/A+l8T5IZ8zxN8g1pDIfA1QWiSyXOmj5TEUuJs
	WaGOdB5n1MAHGYo/hjg==
X-Received: by 2002:a05:620a:4009:b0:8b2:d56a:f2f1 with SMTP id af79cd13be357-8c6e910a882mr103125685a.12.1769170492269;
        Fri, 23 Jan 2026 04:14:52 -0800 (PST)
X-Received: by 2002:a05:620a:4009:b0:8b2:d56a:f2f1 with SMTP id af79cd13be357-8c6e910a882mr103121985a.12.1769170491724;
        Fri, 23 Jan 2026 04:14:51 -0800 (PST)
Received: from hackbox.lan ([86.121.163.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480470c1dc6sm126122285e9.10.2026.01.23.04.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 04:14:51 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev, NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] clk: imx: Updates for v6.20
Date: Fri, 23 Jan 2026 14:14:43 +0200
Message-ID: <20260123121443.4011649-1-abel.vesa@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eLUeTXp1 c=1 sm=1 tr=0 ts=6973663d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=RUlelSpolvTNyr7Sls5SJA==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=TobBm0t3FEPbU2nNDSsA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Z0ZZ1NS68AAPSbx0HHqB-PCD97Co30J7
X-Proofpoint-ORIG-GUID: Z0ZZ1NS68AAPSbx0HHqB-PCD97Co30J7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDEwMCBTYWx0ZWRfX2F1N6oaRNnT0
 bVRP5E/PfBWzf6Po7Tphp5Mj0yS83jlKvn//GkJSHwFQWR0Nxm8fd9x6mAA0mqepT+JngjvmqHl
 sQUi5Ap/O/tKk2/qBZw66YPmLIZXQxGTm2PoE6rmlEyaeIYBoBzkVxtk0s8P/qQwrT+u2HIyAte
 edFt8h2cPdPfNYo6Iam4CVx7ydUJTJeLJsKL7Vr7cKYbfNyKL0JJ9sTry9XXtA7aqcIlIeoagJJ
 ZEZrXJjJxbj+mZFLkhUtE9/ywIsdMIYLtEpj7NQSvkOGQpX6BXr8IqKzR1aQClVCiB8rTwukImG
 oRE70ut4hPF1x2bDvSMmooDzUi4vuLwfr5OtmaTcwPlWweD7DrPE6aFJ3yjW3JkKFBQeuXLSKfx
 JKaUfeumMCjuAVnqda09/v1BjM1Hd/z+G/H5fKYZIXUo4nHEUjQmgmAFjbzHSuyLhf+TaN89T9g
 jl9BKZqV2HuAqTHPbog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230100

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/clk-imx-6.20

for you to fetch changes up to 3e6b0227b93c708e93e33f6c3485bad077650766:

  clk: imx: fracn-gppll: Add 241.90 MHz Support (2026-01-17 22:17:10 +0200)

----------------------------------------------------------------
i.MX clocks changes for 6.20

- Add support for 241.90 MHz and 332.60 MHz to the fractional-N
  General-Purpose PLL (GPPLL).

----------------------------------------------------------------
Marco Felsch (2):
      clk: imx: fracn-gppll: Add 332.60 MHz Support
      clk: imx: fracn-gppll: Add 241.90 MHz Support

 drivers/clk/imx/clk-fracn-gppll.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
