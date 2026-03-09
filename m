Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91631395D88
	for <imx@lists.linux.dev>; Mon,  9 Mar 2026 11:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773054418; cv=none; b=HR2w5gJW9PSZhIexUSK4RHZ48NeBOm7BLMFcGJu29/YT0CEVvnpSZ2WOJqxsZXfmiXc5wPw4entMmntgx4jHPPto+uwUxP+oDFkCPdJ1zv1618STt6yibHxo8PIxxNuwLoUJlM/H1JYdOcB2EKLdSZgfJUWFRhWvVs4XFHX//lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773054418; c=relaxed/simple;
	bh=7jFrjfVpNEF7+5pofyTW+BP7utiTtPBz1JY9cb1Gn74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OvUPXkVX4K8tl7OA4/3O01T3ai29Pp6AZVcmQaKlxmFFK6A+GBfD2UwU3u+C9ghGW3Mk07wKJbBtFAoBDImlZOH3LimU9bcb/XH0Y1/KIVkLcsh/iRndyyyZA9Rg2lIMyYrYGt4d0uLIrukISjaNBJr8i5ZS3Y6l68vBJ06KwDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cT5pkRzX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RQOpNbCf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cT5pkRzX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RQOpNbCf"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298Abjc3016718
	for <imx@lists.linux.dev>; Mon, 9 Mar 2026 11:06:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TrEOcA+LHeeXNlAZJAw+XIej
	7hfOvjSZS4fXCV/6ZP8=; b=cT5pkRzXP6qVFsUdkwZYKvpu2QDIkKWB/m+APQg3
	xlQJXyfUDxe5z5j/J9YHHaQyCPT1iK2NE/VExyzQbVIPzEXUZl+ZXZxrAH/SZhyi
	tKDLTr3m9k69Gy909AFRL0cI6KdJD7DFNOmt3wC463C8wLM48cDSrkLOLtV5Ix/o
	EDSTiDTPnhe+j3+TlBGosUM8+4DtPOw1rEaWNMn42G008p9ZCTZJMzyltrDd9F4Z
	O85hGkC/n+PYGdq5mEMfYii5Gpg1wSToemHQAr1t3Jy3ucXGiNbcLnHmcYvBMfaf
	Gujxy+JLvzq0bucFV/9+WtoERcTQlj3aLeDFfn45uRcXQA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crbkxw4qb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 09 Mar 2026 11:06:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae4af66f40so87970215ad.1
        for <imx@lists.linux.dev>; Mon, 09 Mar 2026 04:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773054415; x=1773659215; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TrEOcA+LHeeXNlAZJAw+XIej7hfOvjSZS4fXCV/6ZP8=;
        b=RQOpNbCfRJ7MED4Vn4Ge6BKR98b5p2WNs6+d5oSeuypj3+2S6Gv0mouS9ED09ZZPDc
         FAVwcOkmoRVEUvC2Zp1MnX6YfcFgXZ2gFTHfS2EhO3YnGoRen6UkluPTG1jRPkBLCdm2
         quhLzp2LR1mlgG21AN9BKNgWh08UrRMIvW5hu17xGuihmubujvXtfPLW93ro3bqse4A1
         /WD/4IoRF/JRxpsWg3l7yN2I3GTtCQFt6jviSBwgOjCjb3h/yx6eqdumeh+W1DSxan3z
         VcmaGekqdjcXci6QTIysaw0uBBlnoFqQ/+32OzWBHQlDTGICCH1chBLu0rv1zhK9KBL/
         zYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773054415; x=1773659215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TrEOcA+LHeeXNlAZJAw+XIej7hfOvjSZS4fXCV/6ZP8=;
        b=O9V8FlXJgkvveKqbumDgnVXLCX9dmPLO87SZzMCU1fwZPay1W+ev+o86/fPpAOZglO
         E/q1VD3m/+1kRRC/B/1DqJ7AL5+SI7irTpBAdHK225xGQRxllV6liju0qFwiZdsyzUx6
         j5rtCLsGbeK/EzeIHavp8VXD2w/EKgIT9CVk5cOJrkMw8Bu7s7o3zA4Qms6Whev6XdtG
         UEFR/oP6veRccBmt94iSIpwwAfqn1GL/7DNEw1btFt2ObfjpmwHXGK3cKcHwJBLMvVI2
         54hWgMMAvzcBpNQQAFRQe6KNxGIPjq2WniQ5nG2gl89ys0i1ZxqnKP0QfQ/pgmPlHFrg
         RMLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbNnyzdh9THteiio4ZCHKGQXgTjbXAvCEuO9zufVBEMrbhhJbZ9py1pfRCpzmACT4NzrU=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywe0q9Xch2HwCXe4MbV+8YyQVvvMMGeHHOMX2FpE9mO8xud0aZl
	ytdb6WDQnAWEITq5sAEYZiIiDJXw+7OxD0PsiYkuBx/e0xK9FNb4EA49MXS6X9YmFi9g24f4SQt
	lvzvkAUgjhterbVHOKspl6zdA2orAo65EiE9sug9EpiXLc6BXaUrPWz4=
X-Gm-Gg: ATEYQzyMG2f3gcaOT9bWG7pJ9tbQ4Epf+HkOdSTVvyJq700jNahZYCb/dT+CM1tcHXK
	YqV+WLO5byM4n++D3F4QgyIJquZx6VoDaOIauuaDnkd0RS/P9V2PxxLM2k0zdvYUSf9DBMsYF1p
	tzCh9CfAb3IXMqSbgZeyLjL8vdiFqbwUNI0QumAJIgTv/4+BMPG/ozCpgxhUxMmVHjnOUwz4rvK
	T6Da8nvYv90JwbVlMHWpD1w0+14gi19dnZZyzsGBPxcWnZ2Zo6Q+tPQ+5tFbxND9FU97W//T+4D
	iF07h/FBLOar7fXwh9scx+na7yWsgSEWyG77yXfqUylYMqBnpZy+D86mYvChTIuCvin4E+5UxSv
	OCDNuitKxuIQAaFH1W94xW63alxu2HT6obX4=
X-Received: by 2002:a17:90a:d2ce:b0:34c:fe57:278c with SMTP id 98e67ed59e1d1-359be353f40mr9443425a91.34.1773054415397;
        Mon, 09 Mar 2026 04:06:55 -0700 (PDT)
X-Received: by 2002:a17:90a:d2ce:b0:34c:fe57:278c with SMTP id 98e67ed59e1d1-359be353f40mr9443395a91.34.1773054414906;
        Mon, 09 Mar 2026 04:06:54 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359bcc2d096sm4067057a91.14.2026.03.09.04.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:06:54 -0700 (PDT)
Date: Mon, 9 Mar 2026 16:36:44 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
        imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
        Jan Petrous <jan.petrous@oss.nxp.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>, s32@nxp.com,
        Samuel Holland <samuel@sholland.org>,
        Sascha Hauer <s.hauer@pengutronix.de>, Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH net-next v2 0/7] net: stmmac: start to shrink memory usage
Message-ID: <aa6pxGDvslU9ygra@oss.qualcomm.com>
References: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMiBTYWx0ZWRfX/rkzt0LOV9qS
 lc8lmUap/hVYHYoMzFP6TMj4X01vz2aX569JQoqbmSPmmKcHftC+tFGhRqe/FsKikDd/7rqlCDB
 aqAgQ/ABNX8q+qFpMp58xB36CpEi+uoGQVRKb6bcRh332YOkPkm+ZOLVU11sqVR/dNYH7MLRidH
 vdjVtnZgw80ONyJlEu6VLeXwIIdq5UVZJVgGbs3v+sX/QD5I1KYdH4eA2WLfDXorZnH91ydzA/Y
 HJkhVbUQigv7CrnVPis4J/+bj0Ycjsa510i3gQXFxYdXZMqoJtJKe8XkVRkY6JGiM3l838a1ecb
 bOthvbtUNFMQl22yvei9IO7w/CW5Ma5SqHnUA7Ae0Sh48eXC3uqWumPMsWiG2JIuc4zpBnI1usC
 fXkZrnP1HfKmw9eiDjfak9FldlyVtIJZgFHdhFWkWp1AqSe38M0lAaMArCWTQYD/CSUacgnlgaK
 qjgBTyjnmec4INuq5og==
X-Proofpoint-ORIG-GUID: UQMjEDWemqkBcsoMlFO-1v3hxekvK1dz
X-Proofpoint-GUID: UQMjEDWemqkBcsoMlFO-1v3hxekvK1dz
X-Authority-Analysis: v=2.4 cv=LOprgZW9 c=1 sm=1 tr=0 ts=69aea9d0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=J-7NsHqoITSIJWJjikQA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090102

Hi Russell,
On Mon, Mar 09, 2026 at 09:38:26AM +0000, Russell King (Oracle) wrote:
> Hi,
> 
> Start shrinking stmmac's memory usage by avoiding using "int" for
> members that are only used for 0/1 (boolean) values, or values that
> can't be larger than 255.
> 
> In addition, as struct stmmac_dma_cfg is approximately a cache line,
> shrinks below a cache line as a result of this patch set, and is
> required, there is no point separately allocating this from
> struct plat_stmmacenet_data. Embed it into the end of this struct
> and set the existing pointer to avoid large wide-spread changes.
> 
> Lastly, add documentation for struct stmmac_dma_cfg, and document
> the stmmac clocks as best we can given the driver history.
> 
> v2:
> - fix error in commit message for patch 5
> - fix typo in comment in patch 6
> 

No issues found with v1 on QCS9100 Ride R3, so feel free to add:

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan
