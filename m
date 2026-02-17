Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0180A36E49A
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 18:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771353441; cv=none; b=nEvcFjk3VpG/Bi4DLX+VTxAVk9ddBxO+p5yoerzTVaptdIoh25g1wIaUAydQ+0BYLfoHtMQVFgSAmM8lPXgeN5hkwzVyh4MjXUKB5v35BicfW7bYc9ZMOAbr3ncR1qvnO+YgPX9YK8w2n8sRu5Ia6XAezoFzuxldAA11xxXDOWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771353441; c=relaxed/simple;
	bh=xn1qa9Wzq30aeozYIZEjQOWZY7YneM3h7/bNRTwQFiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YLG85SJwmLYtBbE8KvgcKPlCBi4SMLSVZlQyC4J9yx5nar6cYRD2fUzL7abQRtBGvQR2LeQxpUzYKN0cv+9AhlNQP8UzNZNqKew1ls5OkT2b34+ye1hMcETov8n5J3XYbb9FSJq3slP8qDX4s6wJwViGJcWoElgV9ws/4V0c3YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dFB0OLP/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O85v0cQK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dFB0OLP/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O85v0cQK"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HAgkJF850240
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 18:37:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1QmuUCEZrBFNgSu7w6yY93qG
	dfCy2AGpXr9u+0yhsQM=; b=dFB0OLP/P2Zw+1rUZLCk+oVjBbPLZfNVad5hyE30
	3eyHyd594rlb+oaHi0wm3ZIT2iPUdiV/Kn1AzykObKvntO5Et9uTUkDTfMz4YGsC
	hC7sUFSRE5FVE0ZhHQlP1NrT7TD+Y3dBzCGNcMqx5E3eQgKjd3KVh6OHmKN9Pf2n
	tDSkPmxLGeNfuUh5NyYs4pt0AeXPWzQ9DH6SALarPo14S98LmrUqi5xwBlPdEUe8
	k3SRvDf9AAL/7qq5iRt8o4gdOHSeS0V8laEZS+30ov6ggr+YZmoaQHEbA3Tdfhh9
	UhGrYkpQPsoHnT2Fmr8uXt/9Dw2A3TFWtNCav7JwRIgDMg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6nrufux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 18:37:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a7b7f04a11so240832935ad.3
        for <imx@lists.linux.dev>; Tue, 17 Feb 2026 10:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771353438; x=1771958238; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1QmuUCEZrBFNgSu7w6yY93qGdfCy2AGpXr9u+0yhsQM=;
        b=O85v0cQKqiiVyMo29HgAszVJz27XHbrMCmikeG1WzLIo9FsUmdxc2cIdcBMQCXDv9d
         1gYVuUCD4wjikg6SSIHMqGdE4Z8gchsBjuSHGqX2msT+vQfytUXaMd7wGt5Eqmo3q8PS
         UsNvCj4ZqXVL+cdD928lQSXFV4HVyikyEORF2sPgX3rByVkkTTXwyXDh6HwujL6iUhKI
         klDnAOLRV1Zi1WRb4VYAoTAy9W/yTQvvOp1qjbxDSSyZzV+TnKn8seu6O50/CY8wRhfo
         QEt4hE6XdHzVbrPhh4x+J0WJs3rGucqe85JRV6m3T99Q+EiUyMTQNqCV1u5zqcNFkifa
         F3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353438; x=1771958238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1QmuUCEZrBFNgSu7w6yY93qGdfCy2AGpXr9u+0yhsQM=;
        b=Bd//WOo4nGN8URq7tV+NDmX2HuTRHFxASVmvZBPXK0DBtDaVIykqRns7wlkSeqE6pt
         Qo5KDSQTlZewSRgULkSOOmWO+Vdnxxb2FKBfTDwgekBDZNh+nCqx21yg3I+GA3FA75AS
         XoaVSVX02aee/DBTwRg/Tr5SGBz/TdkgqTU17hCr+Hlq+8lFxQys8Gd+QeZcM2ZQiAfH
         krRx1KSZd4QBZ0LelaxLbngXRgU+cTk6IzVSf5sTSNTyM+pK5xcJ8KBZ9d6QrVxCyvoa
         6rdIiLpHjuRy0bMQXPscbBmOao1MuY0Xe7ozu8yPjhYk/usccfkMSdupZ0xuBOOijur2
         EMHQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5YvT+kqjDXfFkUwGTCVU1dkPjpkmtoYuOD7QOF4tVKp/Uvs3oWhBI6VjrMUBy2hN/Kqk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxcxVMUElOgWZt41fcUPhURCOT20DF/4GY7IHxYBg339YpIP85q
	XlvSdvltQSAQei2JQNAiCPW4TSySchLa21TJzSOsdgkIeWWnxlluBKobmWnsvTGd//X5ZCkXlcR
	KXWDeMacRcsxTn90VzA/Gi3E8npLhKKvJwgD4jLtdYMAPZsN8gPdBVmw=
X-Gm-Gg: AZuq6aKmWgDpYHSgXJvJixvC8WkNYZ1i8FxOs9lHSc+zbnUBVhkos3OSyQGlfRHjkFC
	vukCHqRjiPSvnnnYbi0ZN1JKW7tGYVZfHeGOKR9Pkc6AXfXqgW0bpccZJQDEOsx7WUlOG4T29fb
	6gVwzndB1bjSDiMO3fDBgSmL9t1IbL7QtrWedBpqyiQAbKU3YpaagbOPMcQIDsw8asT30eaYMLG
	8OrE7aeLGh7JaVzkfbvumbkp4pIG8FtoS4Zn1FvS11zRbRPhOszqXahyXI1w51nlpbaVXz1kWDT
	niRI8wtkg6kthLr9hO8WxQH3fS2k4UIurlBJlrk2dIywKcOCVu6pfC/sFDnGKvXzLUJ6tR2ZUk4
	WCgP6zSBtOSY3EtRG4P+g3S/PTYdh32JKbys=
X-Received: by 2002:a17:902:fc4f:b0:2a9:6414:71a4 with SMTP id d9443c01a7336-2ab505146femr151882705ad.16.1771353437882;
        Tue, 17 Feb 2026 10:37:17 -0800 (PST)
X-Received: by 2002:a17:902:fc4f:b0:2a9:6414:71a4 with SMTP id d9443c01a7336-2ab505146femr151882425ad.16.1771353437289;
        Tue, 17 Feb 2026 10:37:17 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a738220sm110424095ad.37.2026.02.17.10.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:37:16 -0800 (PST)
Date: Wed, 18 Feb 2026 00:07:10 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
        imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RFC net-next 4/9] net: stmmac: qcom-ethqos: move
 qcom_ethqos_set_sgmii_loopback() up
Message-ID: <aZS1ViyPMUmk/+IH@oss.qualcomm.com>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
 <E1vqKPB-000000093mT-1lwv@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vqKPB-000000093mT-1lwv@rmk-PC.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=XKo9iAhE c=1 sm=1 tr=0 ts=6994b55e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=PQJxtWgwoR3tQ6wQTWQA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1MiBTYWx0ZWRfX0ryvESslBbMa
 HvW0lvK6tbUMcpnJ/xXI+nkKBno1Hm1Zp2Lzv3nY7tG6d7PpXEA8sKCugh+nUrC/BLM4mgFhgYd
 N4UGPkhxucQcQRWOUYFnYGM5GDD3yWqEFNvxqUfCzNNs/+vXxksrYB0n4KppPfhfdGRDrA5mh7g
 upJQ7jY8CSBo/gr8XKXpHBPnjXtwyzjmskNlbymtGfqBbSea8KG0u2980gb/Yl4IxPK2ebL2tdj
 NOnyiDmEV6aoz8P2+2LSWpgnQ8gTiQ95qcrCxe34EUe0g8hBOPv06kSa2mzYeeF/AV5R+Yxu6eb
 YY2ynMiRoL23GWXaM0SElOS/pSocOpja/MKSaBgGoAzbIZ8i3HdKlHsXAPiI0Wig2BdTyI7yuGB
 czkzQc9KYEhy0ALmXjXYspnjMRvwZyJt3RScN4HWIfdDYVkjGPfeFvwYfGZl9xbvMP+YRJZ8h/j
 ZpT5r876dNqWyrJSniA==
X-Proofpoint-ORIG-GUID: 8i9e-MrdOBXRBxl7k6jhWvja4AAj7A1F
X-Proofpoint-GUID: 8i9e-MrdOBXRBxl7k6jhWvja4AAj7A1F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170152

On Thu, Feb 12, 2026 at 12:18:01AM +0000, Russell King (Oracle) wrote:
> ethqos_set_func_clk_en() configures both SGMII loopback and the RGMII
> functional clock setting. qcom_ethqos_set_sgmii_loopback() is only
> called from within ethqos_set_func_clk_en(), and checks for
> PHY_INTERFACE_MODE_2500BASEX.
> 
> Move qcom_ethqos_set_sgmii_loopback() to the callers of
> ethqos_set_func_clk_en() except for ethqos_configure_rgmii() where we
> know that ethqos->phy_mode will not be PHY_INTERFACE_MODE_2500BASEX.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan
