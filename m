Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6087E27FB18
	for <imx@lists.linux.dev>; Fri, 13 Feb 2026 19:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771010485; cv=none; b=bKKu532KNzlchjclKGSpSl4dr7EOqVi1nS4oiUQ566C27kBpOceN92h/rYtoiS3Y2FU9i8qsevGy85Xmfn61TOH+lRWcqSZOlDZHFix3qAegkDQlLRa0XTOu8uA2fmJKb+CDVqWr9L6gEr9Y6Xwr9Ba00lVNkEg/kCZ2mmTlttM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771010485; c=relaxed/simple;
	bh=LBhP1N70laMxAtabFHUh0SPSyW/npkn2TmBtw510or8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WcJjVz1ZWQEexqaPRa6y+qnhKLqLb9C7np+WSj6kg4nH0RA8F9JaNSS6eDXFC2gG62bDdX+J0UD6eGI2PEgUMmSVj6Kfvua0Kn2ws8G3mmEgSggcclGwhkp56nM5ah02UYe4W+8CRd57rRn/vWVSYgEQS/al9e1IxlJ3X2zRrno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n6Jpo9CH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=djHXuazf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n6Jpo9CH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="djHXuazf"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61DIUT2B1756726
	for <imx@lists.linux.dev>; Fri, 13 Feb 2026 19:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/j+c1dsKAqHBdFM+Jul/RdoFeeY+gCzkUvQYQD74pFQ=; b=n6Jpo9CHKdqjFPx7
	v5EaF8vVhX2l082qisnceDw76JfYyuBwc6L9g1w4yVqlFMNWW+77QDBsi0b7372K
	+S9LsOh9lh4EhGHWcLlUSXL1ZlmBcX1kbd5uNJqC7Kg/Fmi496jZEkJXjGsOWufh
	juv38KO6kgtRk1KTohNdRF3wQuzpnB0cBkPNi5UkDvfn0LhkabUfLFxuKPnAjLnZ
	gZJh0ap9UNNJfjyQNpivsLTgmzY4vpQ2AV6HOKKWDSlVPMu3vAERkLjC0Re8Qfw4
	YbH1nE+Owm7rr8tFYkNi51LG1delweknJC1MCdM+lOQcbsLTK8S5f07uEuBiu26b
	UfGh4g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9mb14xef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 13 Feb 2026 19:21:23 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8243fc3fe8eso3292580b3a.1
        for <imx@lists.linux.dev>; Fri, 13 Feb 2026 11:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771010482; x=1771615282; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/j+c1dsKAqHBdFM+Jul/RdoFeeY+gCzkUvQYQD74pFQ=;
        b=djHXuazffWrrsvFzNXmOVNbeFAWeIZunGtuh4sFKxTWFs/yyjsz5syDWdvAwQsW8gu
         9BlvEK8ukJyHH1CViEXV7aTmRWOh5kVHvB2s0sCR84a+YJK1EXdyNiVP+rv0D2Qz8bfQ
         bQniZLvzRkJ4vQ1W8eeVGNgAT4QuoS7JT7gQ7gWHXfokGEuSMuZlR/DWSqMgYp1m5Flv
         u4RxsBEQ+UKo2+ixzkUBEJGo9tg6W1bc3MqU9GJQf2LKtsla2asoLhLDSFuokx/7BRLJ
         xJIzXP6bmz/exSXDwMoauXRBeJIvujcNe/xwbY9JpbOq4zI65qk2cTEdURkEf5aAh9h3
         UbNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771010482; x=1771615282;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/j+c1dsKAqHBdFM+Jul/RdoFeeY+gCzkUvQYQD74pFQ=;
        b=t16rSA7r6lqQqiRTwmUSVLDqUirw6ep9xub2ApHFegKuesBk9y12oqS75mL2xthkdN
         YcexEburHDlv7xligrrmvKZUrpCEHCaGn2anIfU2+XFeq9UVdRL3fkFLmmmzyNcMJoKn
         bkbrP7qz6gOCo1p3oCp3HlrDwM5gngZLlgEfcCw3nbh4rADrmOu7CTH7kKhHCZpNphlp
         2x4rHxQP/ZqmwDKfg4UqjCFXIz20zKM3RBl9h+D6wt3DKMJGjDz48UP4qVqwfYqtGV2V
         SytLaKVmAAQWin1RPDp4WCmi70JcypjnLo502vLN72MLeEoBqOH/QxkEKFXmhiBlrp29
         Mb7w==
X-Forwarded-Encrypted: i=1; AJvYcCWiFwpXmybBkmsE/zvDShWCBp/jxS9zI9d0Jqy9ta0f4pnpbJ65gk+JPAd0DV+k+o9IrKc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyJeOeClDDk46NISJ71jtr/+wxY/iJQSDe9NyK7fbGZLDxLilqo
	kakzM/vDsrRdAteRdOU7XBAjemZbuJO/p6T5C+PuHG4b+uxyBjDP+B8sVy+FufZjjVUWkKWAjCp
	yzadMEyUpCYNwvqXZxUamyJMMi6ueKANojgYmrfVCmK5NwsUey+B/M6U=
X-Gm-Gg: AZuq6aIZgszhoOvdfS5hLbSP0+pTJB0y/eOZtobFJMbfs7KkxQKGaw72iLxqr6VCQqp
	OwmZcWv5UHKN0YYAsWA1ORxICf4xTRdmWZCKGaXIW0nEYUVmniX1X6kj9g/sFAyFPTRJB7S7oqq
	K9w21KbITOUpU1je9tduuiERJhvSjExkRe6pPDfBhv4wKtQOCg2FwM5vEUeptJo8ixJQB5tbYrN
	oAtTBFhAnKfQigMwCFA0IfIMpaLX7xjr5HIAIFK19xe8QCaQhUFmOwN+xbq7JLW3JcF64MV/V6z
	T7raTkPsuUGYFhUssqvLI/xpJi7/Sf8VMVAGWDBHFYJGaRPJHF0bnc/auQPD5cd0YfPqM/sNFBU
	jBIQ0xecfeOn2rA+eXDJqbW/y/reaoAozJNg=
X-Received: by 2002:a05:6a00:3996:b0:81f:4675:c2a9 with SMTP id d2e1a72fcca58-824c9310c16mr2776889b3a.0.1771010482228;
        Fri, 13 Feb 2026 11:21:22 -0800 (PST)
X-Received: by 2002:a05:6a00:3996:b0:81f:4675:c2a9 with SMTP id d2e1a72fcca58-824c9310c16mr2776865b3a.0.1771010481623;
        Fri, 13 Feb 2026 11:21:21 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6bb55adsm3238949b3a.62.2026.02.13.11.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 11:21:21 -0800 (PST)
Date: Sat, 14 Feb 2026 00:51:13 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
Subject: Re: [PATCH RFC net-next 0/9] net: stmmac: qcom-ethqos: cleanups and
 re-organise SerDes handling
Message-ID: <aY95qbcG2BLGVzHy@oss.qualcomm.com>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDE0OSBTYWx0ZWRfX7ZaquZox1JM5
 IEHlGsiGsjNQVvi7/wWTt8wec2eQV1dQG7oLZQqO0CBYwP8B6xR61ms3CPEV99cy1Z0iytSufIM
 zP7j6+KVl1BLLbHsg0h8joF9HQ+0TrXQdayVObVeY57Gk1A8vKD3t07lVXc9mLO+EDvLYiuWCVI
 DOMwvk+Reqkx5dtGZ/niS2GCg1wMVGCeuiLspTm6k/v2bkwYIMo2zaL2KaudL5zbAHvfhBgt51A
 mdAGSl8Xg4ccQHLJA5+J2ypCoTJ+ECXya4oV7GfoNYSpUxEyI9zFDzsIHXZbKjkw7Zv42re7kZN
 EtKaMXsxfuTYFH//XCc0WJEhSVVo409RrkdkUMkQeny0mIfUVKnN6xbmsLN6Lvd9+HbX1Y6AALO
 drqr3VJDWV1aoMOnG9+ayO7WtZL/5LIsr5S2vxkzXNewuVDJn6uZUD9Fth2wB+gpD3te/2ni1a0
 D04RJZBgZP82/xu3A6g==
X-Proofpoint-ORIG-GUID: wn3CGHAxYWNpHbSRXf3_WdSFvlOWSdX7
X-Authority-Analysis: v=2.4 cv=asC/yCZV c=1 sm=1 tr=0 ts=698f79b3 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=D3qBBfOVRyNl_mCGRPIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: wn3CGHAxYWNpHbSRXf3_WdSFvlOWSdX7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_04,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 clxscore=1011 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130149

Hello Russell,

On Thu, Feb 12, 2026 at 12:09:10AM +0000, Russell King (Oracle) wrote:
> Hi,
> 
> As the last series had issues with stability, I've changed the approach
> in this series to concentrate on keeping much of the SerDes related
> code within the qcom-ethqos driver rather than trying to move it out at
> this stage. This means it should be possible to bisect these patches and
> pinpoint exactly the code movement that causes any instability.
> 
> This series starts with various cleanups to qcom-ethqos (the first four
> patches) before beginning to move code, passing phylink's phy interface
> (which will change) to the fix_mac_speed() method, and then using that
> to configure the serdes and inband setting before moving the SerDes
> code.
> 
> Please test this patch set, and let me know whether this works, or
> where it breaks.
> 
> Thanks.
> 
>  .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    |   3 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c    |  11 +-
>  .../net/ethernet/stmicro/stmmac/dwmac-loongson.c   |   3 +-
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 114 ++++++++++++---------
>  .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    |   3 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c    |  11 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |   3 +-
>  include/linux/stmmac.h                             |   3 +-
>  8 files changed, 90 insertions(+), 61 deletions(-)
> 

Things look pretty stable on the QCS9100 Ride R3 board (with the AQR115C
PHY). I would like to test a bit more and should be happy to provide a
Tested-by once that's complete.

I may also get access to a board with an RGMII PHY on Monday, so I’m
hoping to verify the changes to ethqos_rgmii_macro_init as well as your
patch from the previous series (“net: stmmac: qcom-ethqos: convert to
set_clk_tx_rate() method”) soon.

	Ayaan
