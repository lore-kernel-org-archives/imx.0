Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1510B48C3F2
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 11:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787312709; cv=none; b=SctUhPtNYQi/JA1ufb0Q7OepZY77S8PSriKMv+aNzVfnGvpzjoJ7oujxMTTzVScThNnpzFvMiWZ5xfBiGXNmB6X6yIki3HaCzBSA72F9NDA31R7RvNg1RQoGiSivivYddCQuXrCTEdueoKdwadOPIa9zAvyEii6t3qnXHVzNfjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787312709; c=relaxed/simple;
	bh=t6UzDLEI5sFGDTGO7Y5vJvN9sIzuySwnVE5VSaZ8VfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rprcoUwrnEFCIpnDIaqS9ruIrhF+9tamKTjfdb/YbcX5gXt+4S5ELBg0w/y66ilQxYHF0k45eg9Js4OEJNSfDC86gY63zSelNyqQDBkqC984C7N55yN1oIhhXfiX6agRSep5CBoguZhpkNREAQt7+wExqnB+TPeEJMwhg9xaobk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VdgImv2G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fxPiYkgK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VdgImv2G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fxPiYkgK"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L9Lqb61799094
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 11:45:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2dAxTCvnWQHdzet60v9peB5B
	pAu+xzdvRTiBy/vj54k=; b=VdgImv2GIIYlPoA7bawOCdd/z5eOizLUkWtHiKHG
	fMJ8kehGNhTBZ0h8fQUpLmO4aHVb4Mho+58HJbtXJmK7pzA7iwmysMFI9YwLuJLd
	0vJSyyQpP6DmL8TfPIZx52bXvBmaOa490uwxGO8tVnTT5LQPCWLV/uSDteUOUqma
	tE65aj8LOjjW4Z/rx/aq+6zvt9jwn5DM+o8amnjPhmorMlOraz66r8EKsa6q4pa0
	p5Q6NGTAo6FeLQBpnvIZHqRMWgICdneh/tjNO4EQy9HTiegVbpRhgIpeHu85e56G
	ImFfg188wowSrriSTZS6q40qjqQT91C/Gs57w7aUUKPu3Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6ecb9r20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 11:45:05 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-738b76cfe03so867267137.2
        for <imx@lists.linux.dev>; Fri, 21 Aug 2026 04:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787312705; x=1787917505; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2dAxTCvnWQHdzet60v9peB5BpAu+xzdvRTiBy/vj54k=;
        b=fxPiYkgKZRmEIS1goatnxFwun8bJZzovUBphcLGKt5PHePyglIpRv95B50M+yr5fol
         BZoEjNiYv1GLDS9UZBhpUNUY6lsWDClOk2nAsj4xXyBo60qFoEcpoBAkJyEW6alDrCrU
         8cTR0yXbP2wecVeYwjEGnGK4cfdHOZGnueCZyCTq+Dwuo405XFglxGJIdbCUE4K5aYBF
         zxqdaqrVSZD4Ku81az395v6z6+RpPx7o8vvv/skGkLRDe06+snYiEDjX8nj1ptfQBv4p
         Yn+MaW8TSq4bpdvILyLQKwv0tlfUEWOPqdvYty4xSvwW5Kf8fe2Srtwcn/jUfA2T/rH/
         WAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787312705; x=1787917505;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2dAxTCvnWQHdzet60v9peB5BpAu+xzdvRTiBy/vj54k=;
        b=JgfbDDsJffwZAhLkHsIxY/LJ3gwy8RpSTIWVw5sxTH5p9TadaqKZShr2Jbishd6iiH
         EpschhoEoR2aY2qOPYqW255g7HEduf7fofvzi1fzZEM/qlHTyGeZFB53msD4Ta9+aT6d
         y3yGJfvJaU0z2wo4O1NIRplF5OAsXdix+6MhUhST/ueun06AmslevxJvZBgnFSY3mzlR
         AZdga/Vk44Q0p/qV3mqtqwDI8hJvHsG6sh3NK8uZOXr9J+K5k20CkO2jFtT46MYFTPSo
         kRuNNzSoztjb5A8CkiPNV7+/XToX2Vrrbd1o/EOUGYS0TcN+Ujt/q6HNXmVxUeg/Adrm
         5hSg==
X-Forwarded-Encrypted: i=1; AHgh+RqTgKSurjN3fTuNnYRra4zc7xVLAe3dp9jz5tzLT2CbWWs06ETPjaUSX67SWNQKYJjcOt4=@lists.linux.dev
X-Gm-Message-State: AFuF++k007HlPIb/CtyjlcM8SlaqT2xlQyU8dHg3Xva9ZizYyeDYBxko
	J31FE4bRuHhw6PyGXm6iRvv+WzwbRIqdNSIUuiGVsqo9uLhClpL3Q6xuntS5ULdDbQQzdA2CRdW
	ke9bOR9/Aq/ZioaqG3i25bhXOfX1gi+bjRHPeU9lvcix8jcTd67VKbcc=
X-Gm-Gg: AR+sD10P1m+2KTU6pLgZiLLIdMLVSayJXl6PKLPeuEg9WgUdlDopnbcJdcsuVgUU7Wl
	TmURjz26yfwmQOw48xAFhRTiiGdStdTP5VM24R9DpVIcVnt7HknYtATC03087GmvREL5c3A5zcu
	4FYqwn4t9Bi5/rlV6MozuiiFhSCx2tJ1z8O0u1e3yMT88uvmpdgylX2t7Y7VHg0jiGQKaKFj0tf
	WHG9OL5GXP8ROgRVNFcTHUVBnKuA0Miv0xdlz/h32vS6ON9XIxzRsUI+f4EOt94ofTQVgp5xX2p
	mFgI/89pN4jvw/cJcxy1NxX8xmTwbXPbkFRGN+LJXYK6MY/LhOEQpukNJtF2f1GtkYwXhaoIfPx
	f1HwKWFTKTWy0agE=
X-Received: by 2002:a05:6102:8083:b0:77b:63e3:6555 with SMTP id ada2fe7eead31-77b63e3c773mr239186137.12.1787312705051;
        Fri, 21 Aug 2026 04:45:05 -0700 (PDT)
X-Received: by 2002:a05:6102:8083:b0:77b:63e3:6555 with SMTP id ada2fe7eead31-77b63e3c773mr239156137.12.1787312704554;
        Fri, 21 Aug 2026 04:45:04 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3feec9d52sm6458300a12.2.2026.08.21.04.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 04:45:03 -0700 (PDT)
Date: Fri, 21 Aug 2026 14:44:57 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Billy Tsai <billy_tsai@aspeedtech.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Taichi Sugaya <sugaya.taichi@socionext.com>,
        Takao Orito <orito.takao@socionext.com>,
        Linus Walleij <linusw@kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        David Lechner <david@lechnology.com>, Abel Vesa <abelvesa@kernel.org>,
        Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Santosh Shilimkar <ssantosh@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Vladimir Zapolskiy <vz@mleia.com>, Heiko Stuebner <heiko@sntech.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Dinh Nguyen <dinguyen@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Emilio =?utf-8?B?TMOzcGV6?= <emilio@elopez.com.ar>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Michal Simek <michal.simek@amd.com>,
        Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        arm-scmi@vger.kernel.org, imx@lists.linux.dev,
        linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        soc@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 13/45] clk: imx: Make sure clk_init_data is fully
 initialized
Message-ID: <gj4re27ahv3pusk5coh55xqrtj5dkigywa3sqysnifxpwsf5ch@fl6guu2elgnb>
References: <cover.1787239813.git.geert+renesas@glider.be>
 <7300fde72b6449d2cd7c043e4caec9a6c4171424.1787239813.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7300fde72b6449d2cd7c043e4caec9a6c4171424.1787239813.git.geert+renesas@glider.be>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA4OSBTYWx0ZWRfX2Ye8MCh4C2eN
 O/SitUXp1fkJRTT/eXzHwor4zuRwn1ZFsvRkwqbp2jB8Ajk5+xUG2wE2ZMECvee9G+g6IDNqpie
 20/ViLlhNjZL7PU/rnViMDhRdzJ2qu/rWHPvVsjhYxPpXoxsbb33XHzH4U31MATCYKVCfisLRLv
 TnxQMDhEQ2fcogN7Pf02DK30hMPunNb1pV05zPg+fZqFs3gcoV3IkxqczGdFmPhzFv7tFx4DtiE
 ad8Ev+M/Qm6UJcmbQ4m+tzrdCppAQj5cbh1V2Xnd8w4ovkJYy6eLnULGTQDI239goxhtwuJKFGZ
 P9ffzsLrtJL8j86YuTuk1ewGKyT+yAJ67zaIZCgV/x/qXIoRkTlTUsbxzMeP4IZY3yU1Sfa2ohv
 OiNsNowJmpiC3VZu/UQ5CBIR9lH81LIVtoVHnp6VOWIsqGL0u1VVqjJD9ZzO9DYUz2reREApfHQ
 L9ok8CHitbkDI3ZVt4Q==
X-Authority-Analysis: v=2.4 cv=e/s2j6p/ c=1 sm=1 tr=0 ts=6a883a41 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=yQKkdfHF0SNApnWj8YgA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: VxtYczdjxQlgfDFy7mwG1qsWCzJSxmBA
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA4OSBTYWx0ZWRfXwUkrkocekMMK
 u4xDe2FWGF3Xq+9q4bcm7SIekgHB9SrunSDxPX7c9jfULCK4JknWfp4FJ6BhsDPH8jSFd7Nd/E0
 7rUY2w8IRaXAQ0VSgEgcYNgnLYL2CqU=
X-Proofpoint-ORIG-GUID: VxtYczdjxQlgfDFy7mwG1qsWCzJSxmBA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608210089

On 26-08-21 10:53:23, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
