Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9ADC374179
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 18:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771353499; cv=none; b=oAGvhwTIax+B6+Ex3WPPKlR3N/f7BRPbWqPk4ksFTGum2RnTOfUhUWLBooPlZ/Tz080buDEcuZak3ZV8hckJFPPy8n8wOWE63XcJ/7Xt92qevtwR/3HCAx1v7vKFIxazGM3un2l9AcLz/Ra7Bd6uAcoeskv2TQYAQsDwvh4P/5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771353499; c=relaxed/simple;
	bh=qq2b2UMHOMaxSGt6ntKxefg6mDqRsZciJsCkvSTWNIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L9LEDGhoR1CcAd+zdVwVwT0o1fJF1QXWP2MYYD7j1mTQgKUUikiVT9AD2+GuB0O345Ej3xWxV/w54dPEbvT8LWWZVaMNvj3HFskN3+IKwVBBJC5gxEYnEZ9peDCrXVNBpCOmRPkiUGEjvwYQc333UFSDt/qczMJ8Cf86ls/wlwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PiBXBHMS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eyI37IJa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PiBXBHMS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eyI37IJa"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HBi2uZ2417581
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 18:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9Khu6RsTg2hdw2N3mhPZSZ9W
	t5OAieYqZleD6YS06YA=; b=PiBXBHMSNCqQwgLRnydrG3YVTrHMg3v9Dt5jPg4T
	HIN+9sJM3DnR7cIZR8VrhYuaZDNqANZcm9Wkw6R+ko33mqs8RgzahmSeZSYLkc8s
	ZPIM1oalh1dcL5dKZNPSeArk7U3iDcfgjswXPl82oe4WI8GEJS3NzVt74ct7D4mT
	923Agy7keBPoncdbs0sMwNdbBsYnu7P9gtZykcMeTNVc3BdBp8fF7ERrApkjklms
	egYhRZRZ1zTJqcBhqHbnm1YXMd7R13I6l/VxnUwVr2eVcIkA5pQzq/lYE01rZx0z
	V8moE+VUhnCub9TvxjO2xLAmebp6FpY5dvUkcZ77wUC4lA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6tmbdus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 18:38:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aad5fec175so177150395ad.2
        for <imx@lists.linux.dev>; Tue, 17 Feb 2026 10:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771353496; x=1771958296; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Khu6RsTg2hdw2N3mhPZSZ9Wt5OAieYqZleD6YS06YA=;
        b=eyI37IJagXzcpaJnCSU/wyZNj+OKW3ltVD9pbpMgQuIcnnKTJhmyL6pKgNTemlmCaF
         L5ph2qA8dBXSR15GicIaxHMBJzZ36uMuwTOFDqi4rD3UhvJdXg6oVR/5c+4U0jmfx45A
         FELD6TY/tmy1XY/rcc53FwoDv0o5otO7gNKDfAqIpOc01UrQK09NmWf9AIjHxXxgfyt+
         C313DQvahKimRz+a033xCaEHkxqMAUt4YUH4TTcMzlqrQJRRox4/WGhcYo2hbDwP5KCB
         AiBFZmfs5lW2XD7Js6boHMW9x6FpwcdrUVRlrZW+ROqkh4UeGU8nhB6I8AY8FPiqnB7c
         tjXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353496; x=1771958296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Khu6RsTg2hdw2N3mhPZSZ9Wt5OAieYqZleD6YS06YA=;
        b=eKeCNZKUEFq2fjiqKFtJ+i8pHO5chxBAw7+/boeSDuVEroml2aaOoqhYotCZ/XZ3yx
         hPPTXsB/V0A0oxI8vFax1dvaFp0Icnr8ysMobuUjtKdPD8D9WW8HyMupiTRg1AsqS4It
         illGOjSNYrRkOuMbhaZI6VOABD/pMsXZh11BimlrLrci6AxiL4LLZqCL5QmbvoELoY63
         2eHGTipV5CiG8ZyTw2xupno8tKiecFS6dajARI36sn1O2UEXcT1LYzI1BR382CS/2L0I
         y2oXMddXRxtvJFVYgwx3sq3OmSgopuH3dJ+Fn13dKFGgFVPXmONQblEQQgqDZVOttNDm
         MhWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpiWN3DHyvrRRrCqOJWGp9hFro1NWVytVn5XEVhB3qXoiOK4TL6WC+qJfYV372RomL/4I=@lists.linux.dev
X-Gm-Message-State: AOJu0YyrsIQ66FKbD5RTqag05rhUd4C9oZnM6iIxnkqEHovZGoWzlchz
	o/1zUEmoFIh+hJFFbgcX935QPVJLDefjZbC/XBkrSBEo9N5wRQR5YgVasNPbuCaLTSYnUhXwvxt
	Sl6FCPYUA6Zv3PFQzbNraBIRAKeVLxPaa68BM4cCH2mdJnB0/O07OmsM=
X-Gm-Gg: AZuq6aJgphy1VbhFF/WPKOfg2aomGhv+FocHfQT+lo7TbELZaYZYl8n7TBRN4pvEBDi
	45fkZzEdLIbC/mUqNpEdo51DTSWjIUrdQsZVPfuMJF1O7gAksOJw/PcouRH8rB6vPPM0STwPwDM
	I6oAnCvE1zQYuaHtfK3lAuCrO0fwgJxHZWrlM/03I4g/TPYpBlzDERwGuw1nIIvK9jn1GyUyL6V
	MCc9lfLjNzzc3VlVXM5VdA/oMjHDhXZmxMxPq4HiEbwcv6Q/Pk9rv3vDR1DPke3Sag68Heu8Gyz
	whgmxr5GctgPNVs9G/sb2JLKjtiDLOc3IpJlFWFp5SXOSm70KOlIj5ua/EyRznm/wDlCWOBoX9B
	AlKsM7lyH6Y4lKKVT33ftR8+pr0qxEWLCe5g=
X-Received: by 2002:a17:902:cf05:b0:295:565b:c691 with SMTP id d9443c01a7336-2ab505173b2mr154968175ad.17.1771353495815;
        Tue, 17 Feb 2026 10:38:15 -0800 (PST)
X-Received: by 2002:a17:902:cf05:b0:295:565b:c691 with SMTP id d9443c01a7336-2ab505173b2mr154967765ad.17.1771353495260;
        Tue, 17 Feb 2026 10:38:15 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1aaf4b31sm100667375ad.86.2026.02.17.10.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:38:14 -0800 (PST)
Date: Wed, 18 Feb 2026 00:08:08 +0530
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
Subject: Re: [PATCH RFC net-next 5/9] net: stmmac: qcom-ethqos: move loopback
 disable to .mac_finish()
Message-ID: <aZS1kIrwBFdwH8Zw@oss.qualcomm.com>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
 <E1vqKPG-000000093mZ-2CL3@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vqKPG-000000093mZ-2CL3@rmk-PC.armlinux.org.uk>
X-Proofpoint-GUID: 8qdTNF9Aohxs445_jSiaBwlQm8IRyDp4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1MiBTYWx0ZWRfX5rII6Vz4AlZQ
 d41xsN5ir0kbQrUCAynL0yVlszzjEDYALX3jIS0p/5qTfKWmR7NoG0VXpMHNtiBakQ7ajDcBr0o
 vUkzwlR4Gs+yyZj1DjafbC1AlReYEw3fIOSN7Y91m0beCFLeoY2p0wH1JSemAjzQRd6K5XV1sGh
 lZiv7fauZamP3DsHtTFuKJZEtc7CH31nXQS0cHEIcHztlR8LcvqJT6W4GvxhygBvHxG7yK+6Ev1
 vwac/8eHqSue2yNJ5y//MTDQCox2Q7EmELBj6frGAN/0b2P1RXa2KJ/xuD1H10OVewT5XmMXJzN
 dkQfPD+OwvBzaqejjZNqNM4JTfXPYNvKLucpVNW+Vtbd4g8I8BMjkP1NZHENStAr2VWqeA1SpwU
 53uye29+TtFmraTo0Bctpa8CT2muhVwIOoyo3mGUt7Tiq8eW/6WDO/X52H8nU6fANZOLKX5Ki5f
 bpUh2L1APztgL3WgODg==
X-Proofpoint-ORIG-GUID: 8qdTNF9Aohxs445_jSiaBwlQm8IRyDp4
X-Authority-Analysis: v=2.4 cv=IOoPywvG c=1 sm=1 tr=0 ts=6994b598 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=wi4T-LJhgm9Wf8MEqCEA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170152

On Thu, Feb 12, 2026 at 12:18:06AM +0000, Russell King (Oracle) wrote:
> Loopback is enabled to allow the dwmac soft reset to succeed. This
> is enabled when clocks are enabled in ethqos_clks_config(), which
> happens at driver probe and runtime PM resume - e.g. when the
> network device is administratively brought up.
> 
> Currently, the loopback is disabled when the link comes up (via
> .mac_link_up() calling this driver's .fix_mac_speed().)
> 
> Move the qcom_ethqos_set_sgmii_loopback() call which disables
> loopback from ethqos_fix_mac_speed() into ethqos' SerDes specific
> .mac_finish() method so that loopback is disabled a little earlier
> after reset has completed, and dwmac setup has completed.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan
