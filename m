Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC9735F8B7
	for <imx@lists.linux.dev>; Thu,  2 Apr 2026 16:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775149092; cv=none; b=ZJ31wkBa6BzjGEo23l/KBbVVrGl51qFFKWO1pv7sglLORuBsmVcDivyqyZxK5mjnTQUBaKbD7PJVbteNhSwoVX4HOP0Kz9UNWDKwH4XsH6aOVIDkN19plkdbRtuwqDqD66Q6tS8WlvXsWxlwDDn5GjIHZ6BZLVBFq/3/5TzkjnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775149092; c=relaxed/simple;
	bh=iVO6CClRzCDCdn9sT/whLwtwO1UaSpLvldz8M7JrZ60=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tpUmeU1i3/gbVHgbrXXpfYd/ZHsmNNgZZjvDEMu+8QqAXlnl3FXDZl1KXUB3KN6Eb7LLP/VKkbYSDdTCYSxOS4CFRhyRUI0ECzrQyjHIJ2vXarFL/Of+PHCiX8j4qF8v45VDkguRsw3QZKoo9PFYlbGCF8oRDPmxbMYwuDQfhjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bf26WH+/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dZi9uc8o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bf26WH+/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dZi9uc8o"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632G4aHC2255206
	for <imx@lists.linux.dev>; Thu, 2 Apr 2026 16:58:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hFJkuoa7ytoLT1UO6Pac5qwA/yzIHHAaZ9JrTM5bhGc=; b=Bf26WH+/dBfUSx3V
	tP2v+J4ciOrokkWLfCXaLAhUJJLbLcXurHv0PNuPz4p3/qhtOi2ycFQCI4OIZPIn
	AmXTTvMY57lGOJr1x6jVC6sU19Dtp1+jV5HbGgtKthH6gECVzjwjqJM25/r9VP/P
	JEIYvnTvC4E6b+G36a2rzMChKKNo1Ugrgh5FF+sIw2D7eoUO0wunrsLoL9WGfPFW
	D4QiquEpKupq/dKcoh0Iva+/il+iRmFvvNlNjBkcMMwYKejhLtkiqXW8NvYv58Oc
	ZiYrp0fhJTwcFR1VCPb80v19P//GghsHJpK8+sS6qKzyr/k7EdJf9x0Hq/2nBmqv
	hs5Ywg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9n4t1yb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 02 Apr 2026 16:58:06 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c769e2b1bd0so549962a12.2
        for <imx@lists.linux.dev>; Thu, 02 Apr 2026 09:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775149086; x=1775753886; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hFJkuoa7ytoLT1UO6Pac5qwA/yzIHHAaZ9JrTM5bhGc=;
        b=dZi9uc8oMM3tHTG/uKQutmk8LN8JiXO3dPbsvM0NnCCDsrK/T4Qy5pBSHQm+MrMCar
         wygm0+w9wCr1uvoS6+bIIjNPqhCPj5el0sPII+/8MxjDQdLCYBPlwKZxbUgg/GZYOPh1
         8epm1Bb7jUeiNUaz9IaAV4kxywjYcioIBG/qahPOYP7Sbyu8/k62Jyg18L8Q3huzeUTN
         3tVlkrKlFLkO0VMfgQPZhDNPKklwu1tRj0yu1+9HUES6CQO2TwxtgQO5ocHmxb56b/c9
         6NzfQgePGYjY+Rj+xVbPXgEYOOfGhvxx3D0YrkIA5wDGPwhETw8yuO2oacWYWBuZhpRS
         hjXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775149086; x=1775753886;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hFJkuoa7ytoLT1UO6Pac5qwA/yzIHHAaZ9JrTM5bhGc=;
        b=PG1EcGfT3yU56Ytzm3SAXJHl7CEci80JB7iEhTTkaM72A88egBlc5kcV5aWv0vp152
         NOFAhBIxRhiYroGFUxGcsVHrE0LZlmYYYU56eQCbven0z6luqBcbiN1CrPJjkmhCt2N1
         uofCqZ1EuHLD+631mgJVwo8mmL8lk/EE5TE/Q8WWB4y0D/LwaO+NUfYbikb+nlse1UlY
         TlkWgRrrIZf5ar07/z1iQJ2PYXWhgJFxb5vb2sid+SZpUwmxSeyJeKOLRa9MsdPg/GzY
         mJERe85Bpe/p7IuJe9cnp7/dcoO5mH3YKbO9+DI+E0+1EXraRTgrtengAvXb4jsigTp0
         rr3w==
X-Forwarded-Encrypted: i=1; AJvYcCUj/yXeOwWboW49GK8o1phTTE6uL/b4uOHX5Hg3hk3Ymmw+gfMB0i1Rg7hBmN2nX84yuQw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxBlQRkFYaSNpj0SJvEXMsmbHPWGqHpfU/YAVRAiigdmWtXI8jd
	0ZCrjedmC2emxYV7E3gxfd0PGzrvIYR4aTQ4Mcc/T9WsawI3Nh1Ge8IOHhKqVetgSm2dG9kE5jp
	MZ4aao6bFqDAz3P50KFol1utl31kdIO2301lQQzM9uyTRTIw/jc5ouZ0=
X-Gm-Gg: ATEYQzwcS7vgwEZ+zIyGk/pnl7bpPZyzzZdZ+mN/j7ye8OddvxBizR9lA7a1h7G8WIp
	8iuuNGi2dXX0cDbm2Z8gk+9Vlvgrnh30ocH4xoeOcR7oXpnvjg238I6zC6r4WsAA/Jgop6zIkjI
	txzfHZZE7wwC9wO6kplvNMmvgBYyWTemlvcTuvGxXkiIhzsSo4jnijkvbl/mcn29Xq+nj6vnVxu
	L3OJJ3v/zvMdPw/4k8Wx9dhMSZRr/XO9Qwgb20BDCk24OWFGsGiWAq7lm7N9I+0oBqrt+oqXnbv
	czqD+nArwdHY4VwayYQBQ6y4uknflTRLT+Fpcy2dZoEWs3ftLqj8uf8/D40h/tFYzNE5ZRRb/mJ
	Z4Kc2RtMk2kStLHclizk=
X-Received: by 2002:a05:6a20:7288:b0:39b:d5f1:4ff with SMTP id adf61e73a8af0-39ef73de98bmr9045355637.20.1775149086040;
        Thu, 02 Apr 2026 09:58:06 -0700 (PDT)
X-Received: by 2002:a05:6a20:7288:b0:39b:d5f1:4ff with SMTP id adf61e73a8af0-39ef73de98bmr9045314637.20.1775149085388;
        Thu, 02 Apr 2026 09:58:05 -0700 (PDT)
Received: from [192.168.1.102] ([120.60.79.18])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c65a3f08sm3262932a12.31.2026.04.02.09.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 09:58:04 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
        kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        Richard Zhu <hongxing.zhu@nxp.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
In-Reply-To: <20260331085252.1243108-1-hongxing.zhu@nxp.com>
References: <20260331085252.1243108-1-hongxing.zhu@nxp.com>
Subject: Re: [PATCH v3] PCI: imx6: Don't remove MSI capability for
 i.MX7D/i.MX8M
Message-Id: <177514907977.11779.10857136002766145178.b4-ty@b4>
Date: Thu, 02 Apr 2026 22:27:59 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Proofpoint-ORIG-GUID: NQLR1RyKYNvcAkH5617DOE_Da4I-dCxv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDE1MCBTYWx0ZWRfX2E2MeSiJMJP3
 LoS6B6sQxrzCPCbrZ7rBVJftz5mfL4+eNbHqlP3VliB9oid7HlPcxpnxETTiG6FeTozliVm8+v6
 kvJo0bGKB/ul2YF04gm+8G3z7YSK0tZwCeNkoYA3UuyhfeSCNYZZV0oDZaS0xnnGp0Lb0a7sZf3
 5gC0FuZwvdpOUj719qD+vauWYaHuHM7ezEH93HpJ+b8mBu8Z99vMgXqC4pi7QEYQZm2eLGibLAd
 O0oveZQ9dr6dkYmtZ/OmP+Ib03c2ucNdgjqiBcXw5Zz5LzvmvzSPQiPvSlKldzea4tH3nxWZP0+
 g4GrZjDw7vq7Vbqwveidhv2fzHf+HEVQ6GKP6TafahipoHDFvneW/nPziWoDNwV+65zjGMqSevq
 Uf21MZrhvK7Rz/08Ybs1tb1SuOY6UMjGHyLSTJKeW8l4ym1PQJcRmhz7430pOEquKROVLSNhYRp
 NSwXADOshNzehUoSWtA==
X-Proofpoint-GUID: NQLR1RyKYNvcAkH5617DOE_Da4I-dCxv
X-Authority-Analysis: v=2.4 cv=Ap/jHe9P c=1 sm=1 tr=0 ts=69cea01e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=+KsUAYeLG1mN9JXONzlAbw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=kxgfuGgQFWlVBPJi97AA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_02,2026-04-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020150


On Tue, 31 Mar 2026 16:52:52 +0800, Richard Zhu wrote:
> The MSI trigger mechanism for endpoint devices connected to i.MX7D,
> i.MX8MM, and i.MX8MQ PCIe root complex ports depends on the MSI
> capability register settings in the root complex. Removing the MSI
> capability breaks MSI functionality for these endpoints.
> 
> Add keep_rp_msi_en flag to indicate platforms (i.MX7D, i.MX8MM, i.MX8MQ)
> that should preserve the MSI capability during initialization.
> 
> [...]

Applied, thanks!

[1/1] PCI: imx6: Don't remove MSI capability for i.MX7D/i.MX8M
      commit: a9de12c04779729f6d404192a5320c2e4dac0968

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

