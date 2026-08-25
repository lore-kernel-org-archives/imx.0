Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7103D6CA6
	for <imx@lists.linux.dev>; Tue, 25 Aug 2026 08:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787644851; cv=pass; b=T5ddCLQA5TQ0ZmLEaBZHLls4eMO4866D7jGSv/0/DGOoHjD6ELvQ+4ym9uW9yqEkIkXjFpqMfmEKv9j0p56ucaOrwDOUunoLcmb7KZaHUwk/GwLrmpOgtYv4Vj5tELxUqEwYQp11TQt9232NrSAEMJ4cvRFyIkZHRDwqScNzdBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787644851; c=relaxed/simple;
	bh=JhXUbAmc4eEDPKk8ugB/b+4DY0/aYbzevBnTQP/qoLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LBxg3FhAnLDwqGzsZLoEo5U11Vl+Z503frQ5/1Ep6XIa+74wBifYO2AeHCYVw6QB5xNVn5PI6tPfkpx2DalRykWIVd/g/KjDmc8H1ivvsSAIx/LLRNeUSawdDCSlyJyXf9Iaqg6s7ilC9e95UPvrWDQ7QmAGjF7iylbVpYVCsnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hW245yiu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eq/NrS85; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hW245yiu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eq/NrS85"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2REbY500032
	for <imx@lists.linux.dev>; Tue, 25 Aug 2026 08:00:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5i22KieYsA+kqY5NiRh4D02J0ZkjG6AI3NKqJFhFDss=; b=hW245yiuzPpw7Zc7
	TgI5VNmqUcEW+F7q3OTTfJAr9m+I8U+Mi99eCl1qdFtPN2dzojQ3waErOzZM/SV4
	raw/gVvUm3SlExnqFleFA4w3we4B3eHvab/tWFLtTjSZXJfySDZ1DKqwOkHzrh9y
	+zGcn1Vz17mWFL/hvjpDHkwGf9jZMNi6GCRKAaTJ6aUKu4tlA37r3CBEXy+uI1BU
	nO9dfrLc6QhISS+yH/aHgJt0l/HNqwUSn0YC5a4QhIYZwS6zr9RomQjt9CEwUj1f
	SE7xuEoZrCDNPmc33MonGrwEmaAcBQyGQD4H94PSwHSRoxoysR8Tr3DQYjQOiUNi
	/Hr+0A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8t1s2s76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 25 Aug 2026 08:00:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so8813405a91.0
        for <imx@lists.linux.dev>; Tue, 25 Aug 2026 01:00:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787644846; cv=none;
        d=google.com; s=arc-20260327;
        b=m8uOYerXK3U7FUZ+5N4PN903ILJT5QakoaC3yOj2y8IKZ1Xt2/Ig7E1MAy+tZkU/dy
         7ahKTvPt20f5kjg56PwdQUee+ZBbQ4wiZw+ockO7JNmQAxhvPSifOdQzrvtj7sEIU9Bi
         VfxVx58N6L8xrJyLfGBbgbdalYMc1iksMc3jQI6UWl6eXToxxfMRxXKJokSXYQdiABFx
         V8lqpYxiv6gdQ3XZd8lvP1WjARYZnWFrG8E9LZO3XdM0Gv3J/fByg0vLk2IUSatMayFJ
         d0Hi7vXUTzs85Bfc9hZS/prqiummZvCb01dMpyl9VYp2YpJP7DKYxr0UyDG5euZD8I4b
         Mx0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5i22KieYsA+kqY5NiRh4D02J0ZkjG6AI3NKqJFhFDss=;
        fh=ZV+uYR6MHr6NTTKXRt7ukSqS5h4Ynd9x/pCMv4cdUAI=;
        b=VEPmuN6rZ5KmHjRA/3HuWbg8dNPlY+5ASMQpU/YoAFxtD2smSay2rZvtnSwmW+otsw
         zJsWdS76ysGLNj/N/a4S9QjMZTdKO2RUEXg39ToSBtSKVpgMO2c29v+aC64M2VBy3Y+l
         JwG9GilEz2ARw7O+DQ5As2pPKZpXOLlSg5CuvGElq+PbYrSMhb/kos9MXLqByYfdMvDn
         nlb84sCtOStDbyRZsixkkt+YfPLenRO3qKEk0DMj5VW4zIleip15eVD2Zsj9in9mcgz8
         5zDupVTvNp0Ax3YrpNbADkrQ/m4H67tqf4BDeMlv14wGiS6M5u0BmiwWZSOSXLhlYAP2
         UH2w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787644846; x=1788249646; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5i22KieYsA+kqY5NiRh4D02J0ZkjG6AI3NKqJFhFDss=;
        b=eq/NrS85YmIs8NY6pO/u/QcAVIbM5Nyl2zetz3SFjjk4cKYoPnTZ14M5Q2pQhe59os
         tYLET7Mx5b3UlRvSln8AtLHAV2LinCMQRGyrdbhAnbcDVGwZyEw4Ss3wMjdWRCeOxlbf
         a1GiG1jNASGqQzVEmF5UtRNHAgqUX+OJ5xC3UUh2V90Gzp2CgbaloJrf0WbyC5Tb5FWW
         tzcFVwEMxy16I6lsbenro2Tg+rIscCQTvJ8oCx+4sPDyeJNKay3F/F5yE7x2T74vxhIl
         nPBhyMUi9lgt+6BOh9a+1IMfYqZ7ewUMbiQBWffh9fH2DxMWPldwmfouj9ImV5JMfWMn
         0DDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787644846; x=1788249646;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5i22KieYsA+kqY5NiRh4D02J0ZkjG6AI3NKqJFhFDss=;
        b=n/fk7cM04tdYUCXegL4J9mTX4LAf0WJ0mAXQ4v8YIx5wUh+h4xqYxrOFUUGl4Ebi3A
         2YkPhryr/Ko50fvWQQF8nHboxemgaKDhMrPXR7lnPy42/ireKf4e7teVq4zl34p2L0kX
         3goZ4BijsBENZNIgrSq5WdFGURnCvFsjJuoFuuVvJ1BehVx7OWwbAw2hcZNgR6Gl2Oul
         EbdbLh1F1Xog677OcEOzsXpJC5JIlfytknd6UD0orS2csZKg1ZACRhiCTWA+fGwB0dUl
         lTY9VkO+ubAEXu+L4mVPv5Uq3Zn0fYHeSRE/9+2BV79e2LBgLvUW5raIbQ0lK03V29aA
         2x2A==
X-Forwarded-Encrypted: i=1; AHgh+RoIO761aHbfBFBFp+MpbV4ODgHdLKUqq/Dxw2yV6RWnN8b3lPLF6jUk2ZldlCMr3T9O/zw=@lists.linux.dev
X-Gm-Message-State: AFuF++lM+/5Asr7q+F394eNHQDEgmXkA7FpPaZGfiA3Xb7zU3tJCOOo+
	msbMHApsKhqJM/ORF+aqlY9hvAkjIzCDl2DWcE21Hy0EhT/odpZDppXZUeOIUdTBVmhUMO3qjRw
	W0KR5OQ2VNDTsfatk55QfqRQPK9ENbLkv+NdCpsxWNEGZu54w8jjahpvcNOSdy3AYjkDUHxpYLd
	Z1gsQ/VLEqCveMNC+TMXHLotRTxZTHbw==
X-Gm-Gg: AR+sD133L/hpbIs+GshW0yjJKkhUo2/FQ8lUU7bl1SUmFdWQ027W98UzN4uc/XP3soe
	sw58q99DEYynZMn7CvdF/muecSlJhhGI2Q2vuLFZx/RQDOMgOWhD0aGGl18Kh8/PtLadYTTalpl
	o2NDBV2wd3SJlQtCQppRqJ+qXXUtAAcuW0CS868UtHrq0pub5ePpTZBu1zuA==
X-Received: by 2002:a17:90b:1d83:b0:380:9f17:6df3 with SMTP id 98e67ed59e1d1-395c3367376mr54366461a91.4.1787644845213;
        Tue, 25 Aug 2026 01:00:45 -0700 (PDT)
X-Received: by 2002:a17:90b:1d83:b0:380:9f17:6df3 with SMTP id
 98e67ed59e1d1-395c3367376mr54366138a91.4.1787644844301; Tue, 25 Aug 2026
 01:00:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1787239813.git.geert+renesas@glider.be> <bd84df92640a05a1a73a8bc775b2d50568a9d0ec.1787239813.git.geert+renesas@glider.be>
In-Reply-To: <bd84df92640a05a1a73a8bc775b2d50568a9d0ec.1787239813.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 10:00:32 +0200
X-Gm-Features: AcwNN1WaGLEXokEDN-w-P7YAI63J28S_AjYowYxFfZoRRRkDa1AUJBYrsKRUG74
Message-ID: <CAPx+jO9LSfy6-3Gb1+0RvHeVeU9dAN+-1jcGaCESpTZXEAE_YQ@mail.gmail.com>
Subject: Re: [PATCH 39/45] clk: ux500: Make sure clk_init_data is fully initialized
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
        =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>,
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: ypcZg8VPxxSuOJraVnvwUK1kjrlbr5-Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA2NyBTYWx0ZWRfX47CTMvM9S/jk
 OGhtkpPyJrg4SRh3inVNPtqUW2ns4uhwBfo5uVrw57cshyuU2U93JX/3RdmRVEKsXkfsWveyk+F
 adFDWhQbr0wcHTp+4mwrjvKRnXkz1jyQM0sWhzRdmzSgxJJGWTF6M62rD7Gccxzstjxb/4HaBSI
 W6BYay168+Z92C0XwIX12/4nfjbuU+vU0dfk3d3HKOiz/qmui4MHpDN1rugxFWjzBtTjXjuGiHI
 9Jwg7DGzvvFYFrOzlKWT/nkTx7w4/hIMpACE3CnZNBqT9H6bdHG6gpEqMvAnTd53LyNOq+OQ/rT
 kWthc3FFrMoyyOE1x/S9rkgOY/aN0LASHENWHmi2rmACMe+vkPomvSXv/++xTqT68RPtuIybDHY
 WYKbkSNza0EKfl0pMJ6dOgnb7NxTUBAfBM9Tez2vCOoZUsHOnuZRM09Rrz0cUc23pR82lJxd3PA
 8gjJsfUC9jo/oBvNaug==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA2NyBTYWx0ZWRfX0sL1hcFWsynV
 vCXveGUNibIYf1tjOHMRnLlWSsBjzz+/YuPBkqEtXnMWfKMG7bPUm3s0FTX5OVAU/lOONmz4j59
 hq4udwHIsc1yz+AOHLNEkQqiuApgimM=
X-Authority-Analysis: v=2.4 cv=L7ItheT8 c=1 sm=1 tr=0 ts=6a8d4bae cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=xsHTnWN7LAWtonkW0D4A:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: ypcZg8VPxxSuOJraVnvwUK1kjrlbr5-Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250067

On Fri, Aug 21, 2026 at 11:04=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
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

Acked-by: Ulf Hansson <ulfh@kernel.org>

Kind regards
Uffe

> ---
> Compile-tested only.
> ---
>  drivers/clk/ux500/clk-prcc.c    | 2 +-
>  drivers/clk/ux500/clk-prcmu.c   | 4 ++--
>  drivers/clk/ux500/clk-sysctrl.c | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/ux500/clk-prcc.c b/drivers/clk/ux500/clk-prcc.c
> index dce235df2576dfb2..dde72d2fd0ac67ae 100644
> --- a/drivers/clk/ux500/clk-prcc.c
> +++ b/drivers/clk/ux500/clk-prcc.c
> @@ -97,8 +97,8 @@ static struct clk *clk_reg_prcc(const char *name,
>                                 unsigned long flags,
>                                 const struct clk_ops *clk_prcc_ops)
>  {
> +       struct clk_init_data clk_prcc_init =3D {};
>         struct clk_prcc *clk;
> -       struct clk_init_data clk_prcc_init;
>         struct clk *clk_reg;
>
>         if (!name) {
> diff --git a/drivers/clk/ux500/clk-prcmu.c b/drivers/clk/ux500/clk-prcmu.=
c
> index ac96c46bd1bbf76b..d89f3b634f8bbd26 100644
> --- a/drivers/clk/ux500/clk-prcmu.c
> +++ b/drivers/clk/ux500/clk-prcmu.c
> @@ -200,8 +200,8 @@ static struct clk_hw *clk_reg_prcmu(const char *name,
>                                     unsigned long flags,
>                                     const struct clk_ops *clk_prcmu_ops)
>  {
> +       struct clk_init_data clk_prcmu_init =3D {};
>         struct clk_prcmu *clk;
> -       struct clk_init_data clk_prcmu_init;
>         int ret;
>
>         if (!name) {
> @@ -357,8 +357,8 @@ struct clk_hw *clk_reg_prcmu_clkout(const char *name,
>                                     u8 source, u8 divider)
>
>  {
> +       struct clk_init_data clk_prcmu_clkout_init =3D {};
>         struct clk_prcmu_clkout *clk;
> -       struct clk_init_data clk_prcmu_clkout_init;
>         u8 clkout_id;
>         int ret;
>
> diff --git a/drivers/clk/ux500/clk-sysctrl.c b/drivers/clk/ux500/clk-sysc=
trl.c
> index ba3258c88d28e101..2127a949e56ccf27 100644
> --- a/drivers/clk/ux500/clk-sysctrl.c
> +++ b/drivers/clk/ux500/clk-sysctrl.c
> @@ -127,8 +127,8 @@ static struct clk *clk_reg_sysctrl(struct device *dev=
,
>                                 unsigned long flags,
>                                 const struct clk_ops *clk_sysctrl_ops)
>  {
> +       struct clk_init_data clk_sysctrl_init =3D {};
>         struct clk_sysctrl *clk;
> -       struct clk_init_data clk_sysctrl_init;
>         struct clk *clk_reg;
>         int i;
>
> --
> 2.43.0
>
