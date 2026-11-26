Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795699941;
	b=0cnWQRLynZV8eTwTGvmWU4y2zamXP/ObVM1i+lAsVMYUhTMiUCmP5tQLk4nQtC89N+/1
	 vjh2+5Hp++87lnGlb4KWa9l3PZ6tlXwg/v43raUGhBuKG1RdCmJfGKze2grVFR88ParKx
	 drx68bfy+91nukq+nW3K+fq8d2umEbb42D3wxSaTJFVVKYKHdf0fhnVpsl3knQ1/o8uS1
	 qPrps1BrYrlYyH9tIPX97pYAKJnJK58Is/mTJSkWUKhCfXQu89kmuX5GManUZxSJgtog/
	 fejYQZrtLjCoF/XoVG4QJmlvQ9z+uMPSDgyTzRviwNuRMnrPiPavE3mtWKnUQuEx2oA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699941;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qEA5KXj0f3ThiS06ddbyc/0mjBi0i81V2WjSLw3INmY=;
	b=MZYzlN6xLmOjj5EQ6QZjyvR8nP5cdgmtTyOGt6yJSzQBO4kbZg2+JvGFUz4IAH9ss6g9
	 HfnXkTKvC0u1nUslmPfsxL0Ykg1JDpzLUK7Xp4LVn83jLVjtkPC9OCW/Loe5bGxLSdpwJ
	 aHXEyhK2aaxC5re7kQG1JnVkRAmab0MfBEYz/2IRKf5MvumqjI47Cy36VKi2G1qi+N1+a
	 uAjcwPc2cpyqnBy77uJFY5uFgDPNzGiHht1nGQ3SxFG2xrWYy1mzIOwbkShX+J+NUXw7u
	 O9UFuxZDMoOdGT/RkMlQrt8Yqcr2KPmqW9zREoSan4zN96XL2BrC2t83izjGm+Pfehw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OjIFWy9q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QZt0sS9C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF17606A31E
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 13:32:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECF17606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OjIFWy9q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QZt0sS9C
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVtoY3178282
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 13:32:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qEA5KXj0f3ThiS06ddbyc/0mjBi0i81V2WjSLw3INmY=; b=OjIFWy9qimT+503d
	yjZC74sVEqO+182EJOCu4552hHfsFtFXTMmzq9aJqOrKx/i6BgN+19SDK6ikqTaN
	zf7KyH15lAvrtPoRhLzPhasxY8iBonsOvtKazucRlDJYFKwjKpzlNo+gepWHOxDy
	z04mvMH32ubMgi8Z7b6AWz9qH66NC62BaHxZUYrw0MMgt8oYUI6wo+EtbZbahp47
	nPd9kQx4DeqYZP6NfHmDRu745AICYva4WymUPZ+zTvMzLBwhIjipLw0mOe6JquA5
	XTJDr8bCHon82OJ3zZvXF0ggfRIi/XGnCBWQuUf4G4NypeKbRkUtIsG3iKMXyZge
	Ul7NuQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sbaew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 13:32:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b08aee6b3eso6046360a91.3
        for <imx@lists.linux.dev>; Thu, 26 Nov 2026 05:32:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795699939; cv=none;
        d=google.com; s=arc-20260327;
        b=IolhfbM2IGrCeNoOxkBPxBfyfcrnGNLbOdovq67F5jhoXEaDnbJXPrlI4bcQJPx60v
         OMvc4RsZ9XLBHdeU8W/lEbIjLorf9bbHcCUEgOBnTYA4yQhoybKkjiBui4ibeeI6yjB/
         NyT7zAiZnlqt14LAzl4ZyE8WLXHdxFVvQw0NqzKLP7KuRlhTclcBlonuk5DAqPF/lLCA
         trwXhZXKwxe1PLo0MVvcEQNjb4SGZ0nzonEhf3qGbnEWzpYye/BWiSRXAu2/5mqvWBU8
         cSDS5zeBcpdm6SRwdrIaz8ETt8uDV3l9h6p1Ri4d76UdoiVlx09o768pLIcRx+XiqYJT
         aIAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qEA5KXj0f3ThiS06ddbyc/0mjBi0i81V2WjSLw3INmY=;
        fh=nkqezA9HvRwJyBNH6a2Vf85zNeF6Kz5hiL83hbkzRoE=;
        b=jGGF2hMDkq3vyB3r1d0WhFplqDOWLkmXOdmHMhaIu7STbPTQn8M7u5tAwsNGWI2fxu
         mhyN8spUVe/J9EtNVIa24/imQImivJvJVbj74gJJ2aZGJV6JkyOfbGeEA+W0IVjK699Z
         B41GkmawJqHv0GUACUj40NgF4LNThYY0zlQOdJBtHsWHcJKG+oROeMaPZqorHUP4BYxo
         sQ50LTN20MJHvMxXd9jWZKzOhdkEyjg4gh0G8wtg4z1FjaZ9MPZUw1oTdaLjIQ9meeyr
         zDmRiJZiezwvIg97Zu0p62U9FjGyQJoZYx4GX9aKT7Af2qZjvcbUkFOgLuvaz7J27WcL
         E85w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795699939; x=1796304739; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qEA5KXj0f3ThiS06ddbyc/0mjBi0i81V2WjSLw3INmY=;
        b=QZt0sS9CUMV4YgXoA1M2CPeXUt/kw/hnTnJC33I8l0U7RkTuKALv6CBxJ2TWPrkSnv
         StFfj/aLPBvhioyZcWbO4wB8OTLR2LLMKebXSzbSOnKisRdZUYN11k9zwtNZI19m5SA4
         R+fB2bvGxFZQcBQ6SuTG5IOoLuH1kmwXX2n7vgW+AYYzgo01YAt4CnKkaO4LS9Tb8tWp
         aadmktwrbaK4hncKG6fBdQNyqUN+OR0eYXJVvR/N/EDh3iKDiq5i6TFmja1JkYAfgRQ9
         D8Lq4fAN6u3VEVwoifFTbpREUgEeEARYax/OZOYLkU9IwVGstjf9mPY6ihZ146u/ZcsQ
         PCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699939; x=1796304739;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qEA5KXj0f3ThiS06ddbyc/0mjBi0i81V2WjSLw3INmY=;
        b=F2iq9jgpIM60JpTlcFz4O0w2TD3DOUR1VCXgL6X0zP1fN6jnB+6pEj1Gmbz2JYIiL2
         y2bmfx6Ino90CVYwX1VKx2gAHq/7b5coM18lYQMC29Jt7kPnYAFJfnxE1uvkLO20Oojq
         tdgo81yIGaDsJXcfV4cAdG9PXs1b0WffDLRNJTJucoGr2Uz9vOSWU3zoah1hfzyfLgYw
         IF7Lc9uKWthMJCN4Pj7FdziQTyAQWhmCay1rTtP2blw3CjZ0QBzG1kCPvS5wSnSa5z6+
         q0FQvyMhXSXrx4nvRvTaKNUiMq6qwb4+AqGdIO5qs+GZdYQzgJHrq2/Hb3f/IdDlibr8
         EbOQ==
X-Forwarded-Encrypted: i=1; AL+hErHAVc/hjJ3nsQ2ZJJGP0FLUTOneBkFh1gLhAzdJylQDgk6QsQxxIHen9sgDThux38aPccY=@lists.linux.dev
X-Gm-Message-State: APuU4Z855hztsoXIogHTHZjpzaoqFYzhrsqGW7iAjkdNxeALH1oBZWNP
	69i0sN8mN52omELroD0bN02nqciuvgl+8urjEfSOZU6nYvOPvMFFaOFWkW95bUZKolaqNdyFQ6T
	rtcJKpPiJd59CTpNhjL+cyxJcZBV83UEyqhQ2oMAsdlxJPWUiYK0rGAXaEUUqKPtOSSSNbqP0fk
	Ua0a/+4IIQhei+UaBKDRiu1GdwVU0DXA==
X-Gm-Gg: AZFdTZeuP9rVuIchKFYysVpDfHgXzeWSnNLLOxrKKyPHVuwWd6sNwvmYXG8aHbMupKv
	QTglcoJD1jl2L0hbYN1CMCK6WppbTFAjcFfZeGYRM6fs1SVxiRWBv9x3DR3jTcdrY4nvzZcraWh
	DJuYaA1YRI7H7+ppYKckAeowcurG+FyHOXQlUrYbxH4awcVWSjE2SLJLwcFQ==
X-Received: by 2002:a17:90a:e7d0:b0:3ac:929e:691 with SMTP id 98e67ed59e1d1-3b41c8d5a52mr19387642a91.17.1795699939251;
        Thu, 26 Nov 2026 05:32:19 -0800 (PST)
X-Received: by 2002:a17:90a:e7d0:b0:3ac:929e:691 with SMTP id
 98e67ed59e1d1-3b41c8d5a52mr19387591a91.17.1795699938695; Thu, 26 Nov 2026
 05:32:18 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261122205136.138173-1-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20261122205136.138173-1-dario.binacchi@amarulasolutions.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 14:32:06 +0100
X-Gm-Features: Aa3M54qyMkmbPaP98YC8FzT7AHfFztRyNksaNUDQLw1O60koDHwGD5wwKboKV-k
Message-ID: <CAPx+jO9kioaEq14zdqVRp--eqvwS87MG7j6Ztg30Xs91wdOEHw@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] pmdomain: imx: Keep the domains left on by the bootloader
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Lucas Stach <l.stach@pengutronix.de>,
        linux-amarula@amarulasolutions.com, michael@amarulasolutions.com,
        Peng Fan <peng.fan@nxp.com>, Fabio Estevam <festevam@gmail.com>,
        Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
        Kees Cook <kees+treewide@kernel.org>, Marek Vasut <marex@denx.de>,
        Ming Qian <ming.qian@oss.nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Xu Yang <xu.yang_2@nxp.com>, bui duc phuc <phucduc.bui@gmail.com>,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b0834e4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=r4OjQRZgDwFT0wjx:21 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=iP-xVBlJAAAA:8
 a=OhlDQ7rSrotYEbIJSlcA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=lHLH-nfn2y1bM_0xSXwp:22
X-Proofpoint-GUID: ZDzAn4ASRurTt_b7ezvqZUXqxsgvh4PA
X-Proofpoint-ORIG-GUID: ZDzAn4ASRurTt_b7ezvqZUXqxsgvh4PA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfX4ui6nUFQU53C
 92fXruIWMa2NvxmqToELxDfbsv+WU8AO9NbiiWEnVtIFLZjl3ReJ7on6hUJgVSzQsT9g8yE10NU
 ZTaelwA8ye0XbqpV5xAYX4VAzmhO/uYQpAi4oyMp3OxNbc/sT4bxsgJyRHaDy0qPhXuL8JPEq61
 X/1cApnoCd0WQkvbud3F6X4NzHOFM3aaO5BJRv4JGxsI7Wekq5QRArnHEFsAWV0HpQyDOa8ZuuF
 Sx088LabuHC5BLMCvE1R8T79lh6KjgM/VEjxA+1yQ+D//Zvx/iO2ron9DNJiU96gJjJKDuAbqVP
 FkrL0qncI3qqb9Z9GTv+XmNY7EzRmEMnwlsSOCNnGZfMan3LRar1S6UVJcKzhyg+ZTIG4erYuXC
 WNgFK928WSjHvZq6hKpGiVSR3wcet/nNpEYdQ3ytIxAyLAgpEOi2k3m32PhptqMUXQalAFmBs6z
 rCBKXrKX4tovQwvxOXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfX5jHAqlPoDU6s
 4LrChikVY2JJ4GGeqj7ArnHARTdNhUFLElChvLTHWkJGPI1rcvlD41oPdyLnW4F5CoVIA/JWtB+
 wfgkK2rDsMsKm/CGQ5j3dALdVLVLl44=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260052

On Sun, Nov 22, 2026 at 9:51=E2=80=AFPM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:
>
> The i.MX8M power domain drivers register all their domains as off.
> A domain left on by the bootloader, e.g. to show a splash screen, is
> then powered up again by its first consumer, which on the i.MX8MN
> turns the display off and hangs the system.
>
> This series reads the state of the domains from the hardware, so that
> the ones left on are kept on until their consumers have probed.
>
> The first patch fixes an error path of the blk-ctrl probe. The clocks
> held by the last patch are released at sync_state, so they stay on
> until all the consumers of the blk-ctrl have probed.
>
> Tested on i.MX8MN (BSH SMM S2 PRO).
>
> Changes in v4:
> - Register the power notifier before powering up the bus domain
>
> Changes in v3:
> - Add Reported-by and Closes tags
> - Drop the runtime PM reference synchronously in the probe error path
> - Keep the bus domain on while the state of the domains is read
> - Remove the domains before releasing their boot-on references
>
> Changes in v2:
> - New patch
> - Release the resources of the domains left on when the driver is
>   removed
> - Take the references once the probe can no longer be deferred
> - Clear the boot-on state when the domain is powered off
> - Release the references when the driver is removed
> - Rebase on the changes of the previous patch
>
> Dario Binacchi (4):
>   pmdomain: imx8m-blk-ctrl: Remove the power notifier on probe failure
>   pmdomain: imx: gpcv2: Keep the domains left on by the bootloader
>   pmdomain: imx8m-blk-ctrl: Keep the domains left on by the bootloader
>   pmdomain: imx8m-blk-ctrl: Hold boot-on domain clocks until sync_state
>
>  drivers/pmdomain/imx/gpcv2.c          |  77 ++++++++++++-
>  drivers/pmdomain/imx/imx8m-blk-ctrl.c | 156 ++++++++++++++++++++++++--
>  2 files changed, 223 insertions(+), 10 deletions(-)
>
> ---
> base-commit: d0f871bfb831705d9f55479f5b2b40f636ea7b16
> branch: imx-pmdomain-boot-on-v4
>
> --
> 2.43.0
>

I started by applying patch1 for fixes and by adding a stable tag for
it. Deferring the remaining three to conclude on the reviews.

Kind regards
Uffe
