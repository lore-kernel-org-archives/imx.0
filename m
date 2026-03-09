Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E945C396B8F
	for <imx@lists.linux.dev>; Mon,  9 Mar 2026 11:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773054506; cv=none; b=e5+IlyZ/uDb72nhl6q5Q0krSrdJPFMqRJEOi+q9W9t84u/3eQ8wD9N45P9Yp9rFDI55eOyOV2ct53QB7ny7OJZ8JNWz0oLojSmjfbYaGF0IzgqKjjgFCG15pZsn/kLv84HAomYHIDUBceUVzVrQtO/qhuHyHCgS+sLwhXj5IKsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773054506; c=relaxed/simple;
	bh=haZYw/rVRG4cTY6XlUED1nGXUhf7pYB6b6bzXHZlX40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lyJEYROLrXPInH1XQdvgRNQbsdLrX+u3FlH7IPYSmPw8hdmSiybQd05Mk0cvjYpP/fqSoMnECPqDWfTxZWRrMId+KaHBgryVvzkT7K02Iizi3jnB+VHL7KEyiNUKpj6KDHsLnLOwzo8b27Snqx1K4GObojdRbrvqfp0JCSOtuQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ub24Gv1J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kFHpqTdP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ub24Gv1J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kFHpqTdP"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629B3WfQ2986038
	for <imx@lists.linux.dev>; Mon, 9 Mar 2026 11:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A+vqi5yNfETZAao574uaaCl9
	A1rW1wYUCbmkQ0a4C8Y=; b=Ub24Gv1Jn9nX9rjaOFOGcGwcZdVmHjStc0FyiSku
	Du3qSxRdTTmlVzYgQU52dkfNzEOykV6TdXX3XU2RMK5PpxOOuVmJnJtQTSSU3aQh
	YZzE5Y5YAOPSZz7lIVDB6OrQqEoNTkG7ubqqPSc695WGs8YU5Pf2motMQ+QZiTG7
	D1KjojNEENM+PhejSi1HkESscTsw9XJIGLBnUwRAt8QC8HearsmjoHY4RF7rJFkr
	J0HybVZePW1OirXbbHCjmvNavFwA67/oKKp+MPInfHMVdnJSDAqGCBVsPFAMRvGG
	933MqxunRvncA0CWlIIQtWPjnVk1jtIPVkCIg6XS4I3Ygg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc3vd3vc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 09 Mar 2026 11:08:24 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c73b1376f98so4640083a12.0
        for <imx@lists.linux.dev>; Mon, 09 Mar 2026 04:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773054503; x=1773659303; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A+vqi5yNfETZAao574uaaCl9A1rW1wYUCbmkQ0a4C8Y=;
        b=kFHpqTdPxa6efc6faAqQvYHPJ7x/Te4yotXJKO56e1TE0H56EfXuc/mgH//bfAkESi
         QWtpH5z0KugMbb7Rhtbu+sHTllRHmAmlGyGBdCGPguCWBRWz1RMy2mx4FvmufHb079tL
         eb0qLUNX+vIF+xnSim5gGxzJ9vA4EjwAKoxajaYaAZBAgyYBwA5dwAUol3nxL2rEzjV6
         lrhFaJWuJZW+Kc1qS84sUeHmAeC2TVpSWCGVzjQUvLGavBa35z7oglKr4u9KPsAreBkz
         UIP5kFBSK/l6oeFI/MRWyxtckaBeJbneDGcRCZFMZpekc2PF6wXdV9MLFe26ICuRH7XB
         1J5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773054503; x=1773659303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A+vqi5yNfETZAao574uaaCl9A1rW1wYUCbmkQ0a4C8Y=;
        b=oFkF3b56pGWlEOyOzbJP1XsOKngBN9ydTKXPv4F3IcB/PwQPdxB0MPaxgsAsbpc+sA
         gm/F0M4RIyiUntYjyZLVesmwKxVJ3lnX06mTO/U8gBIbBsRmklE+zoqZCxxjPwtxyBiv
         tl4VYnX+H0cxYLhM7/+L54dw7ilHcFotxVZ2znTQdaPSZqn3SiXb+yftu6BGZ5iWSzcJ
         IuAITs1kfrbIndx3jldPqiTxp1+EEappW5Un0khVOXwtQ2gKJHivKHaMXUObBAaRHXDR
         7Ns/JAWVkhfvOpeFmD29rUKZ/grlPYLWCWFy4zqS63HBUkGdrR+cH/vHVip3g572uq4d
         FbgA==
X-Forwarded-Encrypted: i=1; AJvYcCUWQY1/CVr3/PRlLwWtQEHq88rI6uNVz8RGiRZHKolPR9sBC3kR6idmZN9Ue+kBUUNvmXU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyA+fJgMYBEMATEwUUyzMBqHwdM+8m25IKs+ZjuLlii39cWYRl1
	7SzEVKVBwkYTIXf0jxp0fp/38IJ8AAbBl/J++j7ywBgJv6WYPIBRBgbD3EJF0mvUMiXZYrz51Lv
	tQPYFM/ZQjRl8jrLAnFCX8jNQ3mJh/QYWmTwdBLoPr0ywm/tUjqzSJrQ=
X-Gm-Gg: ATEYQzzA5GlxPP1r3l61iVT5SAMaJEeBO71M778paHePr49NNmiJF7QHcxFIwgPqOXd
	+LyZDjXLuvlvgPcLZR/6I1t9enh1Yczj3jNbndpFZMSOzOqG5NgJJNjl907cfwxcYT4LUNsP/ID
	f8A2FEoAUfRycOOyEYabdCUGPJ1LSdh2HyEQ/dd2MUn8qdkWEX7Y7325vVHnh5QlWqJrPbbPndl
	QOt8cj8yusorswaFRbyMwOGkrnTX3tlTgzd7RmjWVtaSgX6xg8+NTcMyLRunNSezvyVUxcNguDw
	IMGD0N8sPo+fKdYM2RwuEP4yu25U6zhGfaLlJ1TicOVvKkPB4N+/nZy2ywvCyd7CTagmEPDwuyx
	ZdRPGUiyuwsXLwEUFew2yWfJFbC3QT+WwXVw=
X-Received: by 2002:a05:6a00:249b:b0:824:4a22:ec16 with SMTP id d2e1a72fcca58-829a2f142fbmr7232862b3a.34.1773054503042;
        Mon, 09 Mar 2026 04:08:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:249b:b0:824:4a22:ec16 with SMTP id d2e1a72fcca58-829a2f142fbmr7232839b3a.34.1773054502566;
        Mon, 09 Mar 2026 04:08:22 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48dfc17sm11868886b3a.64.2026.03.09.04.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:08:22 -0700 (PDT)
Date: Mon, 9 Mar 2026 16:38:12 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
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
Subject: Re: [PATCH net-next v2 1/7] net: stmmac: provide plat_dat->dma_cfg
 in stmmac_plat_dat_alloc()
Message-ID: <aa6qHFVdQ8pvDb+d@oss.qualcomm.com>
References: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
 <E1vzX54-0000000CVrw-2jfu@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vzX54-0000000CVrw-2jfu@rmk-PC.armlinux.org.uk>
X-Proofpoint-ORIG-GUID: RmKtiRHdCgmRdwiHoVJz7i3M_-uT1NAW
X-Proofpoint-GUID: RmKtiRHdCgmRdwiHoVJz7i3M_-uT1NAW
X-Authority-Analysis: v=2.4 cv=OOQqHCaB c=1 sm=1 tr=0 ts=69aeaa28 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=EL_Z8gHO3nUhwFgt7b4A:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=3WC7DwWrALyhR5TkjVHa:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMiBTYWx0ZWRfX+d8U6o8shSzz
 ftVLq0uGXxQx+jCGM4nIVqu+xR1Yo+wVTJ+lBnXKlS/BQKnqvnte1TmMDluJ5jjR0rRpCgIOQ5X
 UN8V3G4LRsc+1uuh74llvhiTK2UNzAdw0cDrxrWhr/9dKUb15MaxgB7qXtna20lQKXLvFyvU/eK
 4gbc6HE4YTZ4CQLtnCPERtqKh7n5j40CYmm9ierLy9eIxi2FYB/8N8ByDYt5iMo3vdxp0pDeBmk
 c204FUainKJRAf/cdFtOyAxaArB9tQQmb26FYC24LCLElV4h1FArhRozvc7zsbie2i465s+S99x
 p82Th6ODaaCxCWHd5DsF8/WwNePvmjWPUkBMcL6k3ZFOEdizThknf0CXIMMn151d5pabjWfQKm+
 6jsnVQqnXJzeSBpnMqFO6czo3SCWeJRnHmWsruXaj0GTv9GP0NOgP32Mfb9LCkw5N4a+tJuQMQ+
 xqwEeBR1DCIx1ru1Yqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090102

On Mon, Mar 09, 2026 at 09:39:18AM +0000, Russell King (Oracle) wrote:
> plat_dat->dma_cfg is unconditionally required for the operation of the
> driver, so it would make sense to allocate it along with the plat_dat.
> 
> On Arm64, sizeof(*plat_dat) has recently shrunk from 880 to 816 bytes
> and sizeof(*plat_dat->dma_cfg) has shrunk from 32 to 20 bytes.
> 
> Given that dma_cfg is required, and it is now less than a cache line,
> It doesn't make sense to allocate this separateny, so place it at the
> end of struct plat_stmmacenet_data, and set plat_dat->dma_cfg to point
> at that to avoid mass changes.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan
