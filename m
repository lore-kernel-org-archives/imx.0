Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9254C396B94
	for <imx@lists.linux.dev>; Mon,  9 Mar 2026 11:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773054575; cv=none; b=hbuLJJIXU/INiNaP6k25lF1tLNWeqI+Vy0Lrmbnq1b8x45p14hEwHhNjrR4Qn/OQ9caj7ZCOmq1RpUlKR10U/eRof1hqWcJSc1fR2gkyTnaxwF2GGeVUKbEL+cY8wNRP1k3V4Kvj8SF55aVn3q0SK2LzZ+ny1PJwBYLBfNDjtms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773054575; c=relaxed/simple;
	bh=kXdAlIMWwWWj8alseEzHkxCbtrX3BttbUv0wSD5JaAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c5GawAEnF2aEXq7YistnOto4bwOZGHy0j7raEeVwmYrZmtujZ94um7Lzq8OyKFjycqxYt6mD5qohgc+9pnBQpxCyBH0WkfQs//ZQcmk7e4lZFErNRlFC+BaV6Pz5mNDZ2GMDyLRpJ6JsgdC3xne9CFQUWxug8OTL7OpAb7najnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PqCeTolU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Au/XpJV7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PqCeTolU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Au/XpJV7"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6299tpDO1588111
	for <imx@lists.linux.dev>; Mon, 9 Mar 2026 11:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9GcFU1X0YgGaDvQY7T0H3DK5
	6rvaH9tLv7mLbV4BabU=; b=PqCeTolUyDUnfQtvNv37mNjqVxegnXKUYob3z2lG
	XphlgQjhQnMquTaJQt7KF2g+f5/98CZ3ail8ZOhukncqxq5WKInf2DZL9bnftxgK
	/FYGhtbpYUYQbYqm3EjwwYAMvrOu1i8U+leKtQFkxaUDN+aC1PDvV/qUzLX4k9ij
	wLYuk64n7KpwuMgkHC+219t+94GHSEewV+gh5CQRCnjiKdv0/E6b19TciOUlCtFR
	wxYLt6veXcikC7E483Dm35micc3IxfR3E46Up/kypL1+Dz4Hm2pbHv4b0uIlCnOI
	4oRIxavDO5KUbDFFXCQlzUd19z0kDB8yAeimdXmFgxkeXg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csqcy98er-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 09 Mar 2026 11:09:33 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-829b7ed8964so919121b3a.2
        for <imx@lists.linux.dev>; Mon, 09 Mar 2026 04:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773054573; x=1773659373; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9GcFU1X0YgGaDvQY7T0H3DK56rvaH9tLv7mLbV4BabU=;
        b=Au/XpJV7l/5bL4kJrUIlOmSW9kRfqZ73jBqs9vvD7GDOpF6uuMwq/euOZTCw6ZRCuT
         BSukruZl/2xpmL9wjWmRmdfbGSSq9HETy3pVR/d50mirxiH/RyuZol5YDAkUwaxiIr5h
         F8s9uZWmeJZJnLHgbHOBJT9IYccQUSAiSkKQjGohYx1tMQriz6kjtVtoA0/THb3Ip+Sg
         e30/w+RYgtlYt7TTZj38bVOgMIoXPyP2/s2kLQKU283HZdMp1MWrP0lA7PvxTA4Z6lPu
         14lbKa1FXSNlmvfmLLLw8iIjWwFoUyziQtkfOkO0xayOsRqQ/D6HAaqnWXJE1jdK0mlh
         gyGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773054573; x=1773659373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9GcFU1X0YgGaDvQY7T0H3DK56rvaH9tLv7mLbV4BabU=;
        b=g71lnmZm1ks+kaeMOJGf9cz86HP46aADu2ZKHT4R2qsbs1mCrWnMFIW88zdjHzuz98
         Shxyc+GplnIA1xEQGw57DnSvZiyyks9e7U9Yb+Hp8SQBY9AsBncJk3hfMmqcqTpYyLEM
         hGTnJJKLWqYeEWeSqohtTy6PnC4F3ZbVNpFaJElyrkLyJA+aKMoKT9qN+C2/ntpBbIto
         VkNlWzj8cgUMTwgLEKairIs8PxAvMDBtghXxZcymMyHFJyDdwgq8Ftaeh7rBe8chvxb8
         3pEJi6lCmd22rGEcwruVAXFsqQGPdXTrYvyMenoSa65zpHqDPhi1al4Rqa1OkwZlgqQO
         gHcw==
X-Forwarded-Encrypted: i=1; AJvYcCWVlGmvtMe9ljzMXFnViG2/Y5PYHWQZcNaXQaofU8W3wMiw/0rZQxGg3t6ilF26sAOznZc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyOiVI23LuGLVJ/mC+zhkLRuIaecBm7HTmmklcVuFY1B2tvvvyi
	NmiDG7hGSwAgkiyYQSqRxDf01Q+aE4KFYXYIiSIZnGHW+ue2ftGAyVfMaoC9Q2GnTWJU7g/75Wf
	lkvButhync6//MGEuiuLHBu+jTkU7RSKISo2G4gap9lK4s4huJhYOjZY=
X-Gm-Gg: ATEYQzxYOQT4e2ANgbUnyopIJueaQvXClKdnqVXsjOwYfzLEVwGPqlNXJWATByp05Kn
	WZhzrVNW/1WfzmxEeQ8HD1kmnUovTLDSUikARrZrQILc+nmIekAKhb8EP45g+R4MDZHvLMMTQQ4
	ouFbSrhvkWVEVkQJYzDDRHcy5kfDkfrpSY5MBsWejp39fwhMBL7s0pJXe6MZNAqw0AW5pk1OlST
	Oaa+p2SU3lWWtJZRPcfC738legBgWRJCW/RAdND9vuBmLBA657laEHibnhVzu67Vz2PxJF2U2c8
	lojesfg/6HWsIjtP4jHvB2M80MnfHWLr+J3CGWpB09Zhlstf3wXD6zuipexnf6DZJB3OB3pHM8o
	HTsCCvo4R2J+DnbH315ok5ickToxsZm1sdk8=
X-Received: by 2002:a05:6a00:3022:b0:829:8e38:65f with SMTP id d2e1a72fcca58-829a2db935amr9010421b3a.8.1773054573142;
        Mon, 09 Mar 2026 04:09:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:3022:b0:829:8e38:65f with SMTP id d2e1a72fcca58-829a2db935amr9010380b3a.8.1773054572661;
        Mon, 09 Mar 2026 04:09:32 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a465b6f7sm11967292b3a.23.2026.03.09.04.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:09:32 -0700 (PDT)
Date: Mon, 9 Mar 2026 16:39:22 +0530
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
Subject: Re: [PATCH net-next v2 2/7] net: stmmac: convert
 plat_stmmacenet_data booleans to type bool
Message-ID: <aa6qYo+1san7jL/7@oss.qualcomm.com>
References: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
 <E1vzX59-0000000CVs2-3MHc@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vzX59-0000000CVs2-3MHc@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMiBTYWx0ZWRfX1UklsIb86Iik
 H0rbe0wZ670tX4qYPwG2Y4GYeaNXYgV7grSW+kSZQ0B6tGbedl/hp8haSlDHoMtMtEutF8MThEU
 St+weW2/7/WWlOwoiA7DxmWc2jdk6nhwcpOEXfuM2BxqUby3KcRsk/+gMVVhmgL4ALnXdhK/Hic
 65AQyyKgSYadwtZINlxyC7qL3/NBXXacFnWFgrOhehIoI9oOB4x1e3/PYgkwQqggkDzh94C/DTS
 gSzFRk2K6mgavVWAW32p5WxdpcW7ofAtCeRPIyNgGINdaTk06jsMtx51kiaYNQA0HIRb7UKLp/p
 QIjUIbMJM83SKZdZrihwZQ29TWN503NeN2xe+IeP6QqmTPlHnOvxm7DQxfBXCPrD8cAYsRXf6LL
 fG8XruJgCmxEsfSFH6l6vKDp15o2jJ1GifjTHR0KW0pmk5x9M2MMBhOGqijbo1x6YgfxkNWY5dp
 2LySFpGxtTegumdMIwQ==
X-Authority-Analysis: v=2.4 cv=QJtlhwLL c=1 sm=1 tr=0 ts=69aeaa6d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=91TNVAZHAA1vfZ95losA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=IoOABgeZipijB_acs4fv:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-ORIG-GUID: INe8XxXyOT02MV9O_6rT0xsxdZ5L9td9
X-Proofpoint-GUID: INe8XxXyOT02MV9O_6rT0xsxdZ5L9td9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090102

On Mon, Mar 09, 2026 at 09:39:23AM +0000, Russell King (Oracle) wrote:
> Convert members of struct plat_stmmacenet_data that are booleans to
> type 'bool' and ensure their initialisers are true/false. Move the
> has_xxx for the GMAC cores together, and move the COE members to the
> end of the list of bool to avoid unused holes in the struct.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan
