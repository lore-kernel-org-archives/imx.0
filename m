Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B97642BC20
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 11:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785239078; cv=none; b=AtTPnG5uUzzOJZY5c7YADevrzmJlTeQmrHwo8BeyVtf/0fd0MSMicPWoKFfFo68J1E7r/NWCHkNhRvvXo9OH7HQiP7D4EoswrSenEZQMTFPrxWJvw7fGsBU86pcutYy+ta6vuQrO/gO46Ex43FtaLyJv1punNleCiQdNdFNoBuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785239078; c=relaxed/simple;
	bh=SCPlgsP3hnEskVZkHcQYXzAvTGi11HpqtwPxR5Zm4yc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VyPWHQGzAok3mBO34UomyGFMBStpID+62vvkZOd5jszYhtgDUZKTWXApCgiS1b/HriayrsN6MTaIMeGrQNYAU5vHXkUdhqYV/yD+PvAYPVdbX1Y5Xz8GnsmaRU8X52p+qR5jsF6YrFgZbiOiaC3a2z7CWNRdCADkc3zSgEBCHnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jv4gHMYS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I2ts/QH0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jv4gHMYS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I2ts/QH0"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBHAWs2940181
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 11:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hA+G3FWrRx3/7OkOiAbGkn+XAS9qcZ73GDYscb3Fmd8=; b=jv4gHMYSGE11DGLy
	bbwGnuVgx0f+jXMaPrkNIUcRwR3OOq9j5GE+jwCOrOUndea01hGkW69umTYoNHKR
	x57Di+bYhNmSsKsMrQkvsN4+tH17tf4fsF2Ig7U28Tv675nPEvKvVUfW/RIetp1V
	COyw6PsU9l3wWL96iQbwcCsxRnj/f7xgbTe1PBAJEcYv+92YJkKz8zC42hNT3nT0
	2MO4aFMxuUwW2ODdZamKdWjchQJYaUcTFYsLhTuyoYAtMwAXR/0H2bRXjnzF0Lss
	yEZKuh9y9fmGXHAkSDgi6ekOugLFPXh0M9viTEv/wmyXlwsiAnNiCGQg23xqz9Y+
	i+c8Mg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpmy11sm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 11:44:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c26012cd0so37083741cf.0
        for <imx@lists.linux.dev>; Tue, 28 Jul 2026 04:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785239076; x=1785843876; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hA+G3FWrRx3/7OkOiAbGkn+XAS9qcZ73GDYscb3Fmd8=;
        b=I2ts/QH0eHvcTEhpUELsOL6cciK8GCaPtWUl+dzgagckmvX5LhYGBnhwkvbaXW/saA
         142IzOUeSpgQtsoREnqaIPDVU9mvTPHxvfbiX6FPFhJZQ2RV4RHBS6AXo1GL4kJkkq6p
         jllT3zgrxz7UBbS3jHaBiwf4VXMEiInzL+xAxngjzzRPrpbIDVK2e7PtrQ/IsgHiLUU/
         onnpzyJ6n5p2MRenqW9YLqEbrw+CmU5aOXmB6ELnjgnDIqPbuHlDYKaZYG9PkGxgjbXZ
         EnXt6X6PEmnhOQL20NuZqVRCZ0d5nlaqAF02PyNkRZfDAajRiu3I/FxGAgaqfalJjFi5
         IjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785239076; x=1785843876;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hA+G3FWrRx3/7OkOiAbGkn+XAS9qcZ73GDYscb3Fmd8=;
        b=Qn9yALRg4UsoVoOkcjHPzzR7WDWsrWmW+dLZMO2YZGP1urLPGCmySzLRznM4qrp5uN
         O4di+bb2MDbfgEVFr26cvGtLE0HXkDg7PspjPUI6jY/rTbiaJ/CPUn7w3J6g5UqlPKL5
         0H11wa7WbN7kj0pKuO7mC100vDNoUG8AFyOeYJtXAjhbhnLcGNTiXS4Hrmvb+DliLQuH
         601Ll/d1XuRR1IYNZLr9mzFf176MnYxCDacdoKId3ELxdXB4NK/StQk/IDeh2EBSlMTe
         qmcHJggVyLzwIqmnWdg+duB9UFuHKWGmVte/IYvjk6t0J8uQrZ6h7Qwe6R9blbm5wc7S
         AhwA==
X-Forwarded-Encrypted: i=1; AHgh+Rojt2NDBmWyZuV7B+RkfRNvLuzqws24OsPP3bTgugnJt5eswmgA3KTQdcxM7UZlfdFObXU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxza8sowpuBsaR5InYuFTD5ycuIESRYaEeEiblYddsK7rSy+bx7
	ixs52JZOnn92BoOVwuMGhyPx72EnbQolGKXb/WZrGeNI89sMDcTrm46AIX6Y+Y4NAdoUyrwC8ES
	P+1f4KwtK2RTOb0I6orb+Vgsw1vOfmxp7Kju7Nc3yPtsuVNKIjdTkWK4=
X-Gm-Gg: AR+sD11+B+/fv0j+dFVz2+5EHF73CftTSMOtD1oHunSA21s38euyE/YJdXOvPefVCfx
	D5612SQkOBUy2kdeMN/uDeH6+xGt6tYxg5vrHBoEHt7fFRWstFGzLQbdlWYHrev5JLuHPAPXYlE
	Y0+3Wa5ueOrDg92FWamveawdtKyvhbdDDBEQ5Dk9VUz4yJmIkXbMN1LeLNShGRPX6JRmIJsfE32
	ycfdvIsQUZVSopUKTUT35KNYSFl9jNox5YHylJJmulgIyVOaGhTodBnUwEYdvVZo+Li8gQIHVE4
	jvZdQUegUCvZFguNGDgJQTsKJC+7Hg48T7Yz/5vF/uChU27YTIt59qQChIdq5LzLz3rFUo0m/w7
	RD4Cb1EXspFhpiwcQ6o70GbmMi4c=
X-Received: by 2002:a05:622a:6099:b0:528:2c84:eab0 with SMTP id d75a77b69052e-529d6febccdmr14880781cf.33.1785239075514;
        Tue, 28 Jul 2026 04:44:35 -0700 (PDT)
X-Received: by 2002:a05:622a:6099:b0:528:2c84:eab0 with SMTP id d75a77b69052e-529d6febccdmr14880451cf.33.1785239074900;
        Tue, 28 Jul 2026 04:44:34 -0700 (PDT)
Received: from hackbox.tail37bb1b.ts.net ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c46160dfsm68407265e9.10.2026.07.28.04.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 04:44:33 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: imx8qxp-lpcg: add missing MODULE_DEVICE_TABLE()
Date: Tue, 28 Jul 2026 14:44:10 +0300
Message-ID: <178523892597.3206426.9839796050090970254.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260704150344.59563-1-pengpeng@iscas.ac.cn>
References: <20260704150344.59563-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HhJibSCQbOGrEK9iDY9t2H2TcybI0s2R
X-Proofpoint-ORIG-GUID: HhJibSCQbOGrEK9iDY9t2H2TcybI0s2R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEwMyBTYWx0ZWRfX0QsPlg8R5p9C
 L/kZdqMTjUrUBF2P9QcbH/l+YycYdSfHViCQAz1xWFbLtpfCcC/DRDet69ujkr4uXd/xb9Akm75
 eMTW/8TVlbhPvd1AbAspPlNpuWfVW+R4CH48NdXro72QqEC+mS52WqwFxZo8+18ho8izvTa8lx3
 IEDo380SeH9Inc8VwFp42cQVNGXMon4Q1fSczEnSm3cB8s3dmBIanHJ67+EtWfFjuRC/hydA/Mf
 2+U2lY2/DGD0pPQDBrat4TR3Cgcfe/ygenfxKQHp2D/lsfr4nlOQ3iY1g3UlxG8JvC/8mTB+1ja
 V+LqhQWw8rLHw4T4MEnSjmV1zgEyftZjkypf6sGoQAlBdIwTwhZ0NH4WcHAv31XI9QIWOBg6ZO4
 0ggTeyydTfiUYsf+epZg05iwWGyhJibAGKYlCTdP/wats0yuYNQZlehvP8QsSKKNxgqPy23oq99
 LCwj7p87FzSgMQRqFLg==
X-Authority-Analysis: v=2.4 cv=PJo/P/qC c=1 sm=1 tr=0 ts=6a689624 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=_ysCb4Hr1M9gRo8ogBUA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEwMyBTYWx0ZWRfX7ewKyTb/IBii
 CpKnuJoFUsYWoIpzfjNGXWRiNsiXX9LDrc3qSq72O5T/gndyZ4xoLFxBRlUYjvJRWwwsLgtEi6v
 Keq78XfuA/aizXi+bGWp1t8VqkVZDPg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280103


On Sat, 04 Jul 2026 23:01:41 +0800, Pengpeng Hou wrote:
> The driver has a match table for the of bus wired into its driver
> structure, but the table is not exported with MODULE_DEVICE_TABLE().
> 
> Add the missing MODULE_DEVICE_TABLE() entry so module alias information
> is generated for automatic module loading.
> 
> This is a source-level fix.  It does not claim dynamic hardware
> reproduction; the evidence is the driver-owned match table, its use by
> the driver registration structure, and the missing module alias
> publication.
> 
> [...]

Applied, thanks!

[1/1] clk: imx: imx8qxp-lpcg: add missing MODULE_DEVICE_TABLE()
      commit: e89485455ac49925565061733c0d73d568333fc0

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
