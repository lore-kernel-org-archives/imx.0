Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CEE42253A
	for <imx@lists.linux.dev>; Fri, 10 Jul 2026 13:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783689609; cv=pass; b=OsaA27/6/qVIK3Yds2zoPk5oeMz6sXoC/MECN7vkzWzCXY6c3zkflMeZuyDsSksvO0V0KiMLjyeHor3ZI/UoFWWkNyR/h8nEwcVsC9agzusOTQL3oUQbo8OCBfRTJ8Ff1NbntCgIdqwlYi3kReK2LPEETbYDqli2m1sjubQ6DRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783689609; c=relaxed/simple;
	bh=hqFXr31iND0t+oWxM2LNH1lwtdOVb5fT6YPXD1RJ8IE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rKygc7nUT8BO8kI8dmVvaaVxZWhpYfyNrwtyNSVNdjOWXIBPTsToBUECQF4/lSox4W9AwByXylRJbSPEq0xiJmXk3beQ28Gbc5o4YL/WBZExqiXcvfX3Mzmf9d6gT1JH8EXuIP8R5d+fmRmDQDT3JwhH6+6jLYrde+bsz+TfI94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FuN5/hxm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DnUk5LaM; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FuN5/hxm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DnUk5LaM"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD6n21874859
	for <imx@lists.linux.dev>; Fri, 10 Jul 2026 13:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+IKDvfDzFGbwqSYx2nsASuQ+2zeb1K3v/PA/7fdhfbg=; b=FuN5/hxmAGVOeKhz
	TBXLUDz7Km+ZWilvTYvYtq3PFQOnOSWFHA9opAz/gllgit5tdnJLEJoQDle68SNV
	pL7XLqwHz+8JmHFQz633EBnbhjNVFtvXiT/nHHc2OaWH9eGzMf8r0XR3baY7F79U
	3c7cgG2tN54fgBFVhUMmCUf2TKm/5JzINDRGTYay3B15v1bou64+t5n1DeV6tgmO
	H47tazfJIhW0OLhyODJadCuDBCnO2NQaN5gYP8YLWR85cvFVMWa+LNh/d78N3e7U
	uAiPlZkQqYmN5LTQQpcP05te26eHk+Qz7DPUrRcN0aeTjD+h9pRBW1UlA3AOlqG/
	emJzgA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5f8sq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 10 Jul 2026 13:20:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e695a3b28so222219685a.1
        for <imx@lists.linux.dev>; Fri, 10 Jul 2026 06:20:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783689606; cv=none;
        d=google.com; s=arc-20260327;
        b=C1HtFz6efS/932JpKabrR6xdsrRSx3Rzh++WPCLZTDNifjVpi2AM1VbjxQk0yIyUny
         2zEhW6Vg3nrLGZV+EmrB354g0EKnCcOpWm1lyd5X3TvrP2yavRqumyery+Mdu6PRrA/A
         r+4C5Az/M46V4gJDJCLlOELgxufRl9gktdjvD1OPT8kyndPcgwpmgDnEb9qsP1YZQKHM
         G7P2CvShLaReaoWwKO2Dy2Hovi/yE9B0YgchCVxVvbwDqBT9+SN5trR8TNw0PVW9l5gX
         dbZVU4W08TYX6KHN0qB6m33i5HkWE8Alu1GheN2Ym69oG1vcAS6y4mto8gyXautFp/GG
         s9bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+IKDvfDzFGbwqSYx2nsASuQ+2zeb1K3v/PA/7fdhfbg=;
        fh=xoRGX59iZamZi/DnKUvltMK8T4yQaY98cSl0x6GHK+M=;
        b=ei0c2TcP/qUmBe9s+i5aWwV31PkDtp3pXPSj/xtZIlrrdYKu1lfKKB5he/8P5Vud2z
         VUPb65DEBGZYH5RQLRSYWgWOMBrGiypWVKPZIZ6sDCsuF9ygybf/NzkZWezMKqLoHZbc
         UvcTwNf1ODHITVrWfCbYjmve3NBAodKrWZBukM1DJLeNpWVYrJOm/UWGDXD0MsfndnLd
         yAjnwv3fgmMf+UL8U3kMTzrnOALY8xsHl9yP7yyLdnYPv/9R4rcAmsLc69WxCUYX5B+5
         jj6WWiOhbGqjsJK8cCOL5Sb88QIQ4Rjomi8VV0qoTiuqNu7LyGzK/zOlfZtOh97Ti44s
         pePQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783689606; x=1784294406; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+IKDvfDzFGbwqSYx2nsASuQ+2zeb1K3v/PA/7fdhfbg=;
        b=DnUk5LaMDXhLwYAx+1WTQUZLv9SNKRa+BOD2jpfbcnHJwMo3gd4LQ6QTMb4VSrYxiX
         fbZtQFt4QSx5r7+5/RqT5/SygnU4niyri7HLNaKNKKt8NY9fBstRjpoIq5VY5aiBSHCi
         9T/z23bGHZfdzxPMbASMVXndbPuCzgYaqI3JcE+413rKul1iNPQ49HzBcqORc6IT/tPw
         m3jXX7n5ckJGUKGj+b5xQHhdjs+2VkZmwYPg5W2GvIzGSEH8pH7S+LpFB2IFL2m3R343
         8Izze3dwoq5r8OMiK5PR00e/+MnuasFA2F1L2OU9rJIqhIJfRCZ3z6Hrr9H/O4KzOlGe
         g0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783689606; x=1784294406;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+IKDvfDzFGbwqSYx2nsASuQ+2zeb1K3v/PA/7fdhfbg=;
        b=CKN5s/e2x/NrqZas/D7QJTQyAfO0LpnmycZT0L6/OM5KUVp9AA/XGUZUtC3dtc6YS0
         kBBvCWXGIe7ESanFeqOUVZzIj7gMa9sz3hS1WHLsIC0a1rMmE5PXJUihSzWh01ODN2EH
         NO4wyD3pznKi73KgBXhyveT4UpzBNiSG/Sj88sZmn3uiAGcDxGn8tSQtlUMD43ZXs8PD
         ItkFWLeC9QNNUoJfi/1ZGE1T8vPG33ysnrfdoCwRXyVIdeq69iBcJ6bznH7CxEV2LJTe
         h0eSB5vMrAHe/NPp6htbzF2i3NPEEFhqiCD3z07Kqv+57u0JLn+qjf+mys36TBXKcqYu
         y3HA==
X-Forwarded-Encrypted: i=1; AHgh+RpnDwF0+fHMjkcigpktHtTc8hMW7EVV0zX1LyquIvgwk2Lr/gnXEvUgHBep3Czx1iE9/+A=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy63U39MuAxJ2uB1B4t6+WVkYQ2dcojg6WcY3Xratj0skVpi8Jq
	tTnelkf23O7KMoAT65ASjiYAknPCC+EMVLlB19yHgfgR/ydodxJ9rjCAsbGv97wYxjt1kavH7q9
	RboxQ8pn8ASGra+bazV57Gb53LQP7dAslp0Mt9GVcD3+rMIu7aEy9Vc3griR/0zOo5O6qGf/YL0
	cbv8umZpsYnFTz+j5H1/yDPn/vuIB8Cw==
X-Gm-Gg: AfdE7ckxJQFjy7lTts39ooEEsuxEzrW5Su9i42Zwto9SXL7hPc1IyBBGGqF1izp4Ttf
	6Fzijz7cog30mSzmZ9s5bvx0Smc64cVGsY//r7kTm/DrCbN7IilnKy2DXziaiS4Dp1FGJ3RAfI4
	ovz6Xv9YIAOgeV+wWyXPpBAHwKPFtZ3UKWS0svkzxPtYZIXpsuw7TWENBsPGnOHBX7Lk4c
X-Received: by 2002:a05:620a:3703:b0:92e:5949:3567 with SMTP id af79cd13be357-92ee4b9c9c0mr378848685a.14.1783689605943;
        Fri, 10 Jul 2026 06:20:05 -0700 (PDT)
X-Received: by 2002:a05:620a:3703:b0:92e:5949:3567 with SMTP id
 af79cd13be357-92ee4b9c9c0mr378840285a.14.1783689605263; Fri, 10 Jul 2026
 06:20:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260707110303.3779799-1-ziniu.wang_1@oss.nxp.com>
In-Reply-To: <20260707110303.3779799-1-ziniu.wang_1@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:19:51 +0200
X-Gm-Features: AUfX_myX85sm0CK23HsaVBWLtyuOsQFVaWPiXZvcMl9d2lwceyk99PJTRc2r1Fo
Message-ID: <CAPx+jO9PrycaUM2j+BS=pa994DzWqYN_yQQk7=pwkq+ik-xeFg@mail.gmail.com>
Subject: Re: [PATCH v5 0/8] mmc: sdhci-esdhc-imx: fix SDIO suspend/resume issues
To: ziniu.wang_1@oss.nxp.com
Cc: adrian.hunter@intel.com, ulfh@kernel.org, haibo.chen@nxp.com,
        Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, imx@lists.linux.dev, linux-mmc@vger.kernel.org,
        s32@nxp.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Ab2B2XXG c=1 sm=1 tr=0 ts=6a50f186 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=8AirrxEcAAAA:8 a=j4ls_bG9junj-QLuZ2QA:9
 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: 3eIjYvzQieputuw9TqAmautdRiyDQKPk
X-Proofpoint-GUID: 3eIjYvzQieputuw9TqAmautdRiyDQKPk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzMSBTYWx0ZWRfX7jR4aAYT8RHS
 RkcEIdB+ndSw3A2UUkkhKGmqSjw1Or1qGFLn7KjNYoipE6qKMx1UBRpeyZBor3xkrRqGoOIlITF
 AiNN0/XV8zhKKOf0l+RMPM5/SktIdLc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzMSBTYWx0ZWRfX8iG/BLpeqad3
 ZHcRWgTniyR00l4VRhD2kE9X8F+e+VhNwDu/Oiu4VlSZo+Y+3M/1us6r6BSUtc96CH0DQS5cIz7
 SeB+mMi2XXYtk4mU2tThIx1ovuL4A3Bw9UsLkJvOyKynlvwJA+CXpylsDvBCF9pn9V+zDmFm6s7
 DotCLR+3NHS2sGxZ39CkBBokDRfPLoIdcJbOHv967W2toazNAD7qphuVGZ/IOFU+6p9+RejNXeG
 ataDTMKPD6DFv8W3SGf/+GcvvlLDe/yMy4ukJ7mdn2WQ+w0+SoOBb1MfLIz1UdE10gvvJkce6hm
 QXVNe3uSQVi/dzEZ68WCq5y3k7jBUWOTJz7hJ0HNIUGcbm/wHXKktSjti0kF2fWVYMYQ33EPLjm
 Z9shDENmDwQpps7NBbBuAQqOABmW8qQK1YnLZ/i59HEFf/o6FeOK2DuW+zfZsvRsNs7wmhrmwtF
 oFsVFRmM9ooVpf7AZ2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100131

On Tue, Jul 7, 2026 at 1:00=E2=80=AFPM <ziniu.wang_1@oss.nxp.com> wrote:
>
> From: Luke Wang <ziniu.wang_1@nxp.com>
>
> This series fixes several suspend/resume issues in the sdhci-esdhc-imx
> driver, primarily affecting SDIO devices (e.g., WiFi).
>
> Issues fixed:
> - Tuning delay values not saved/restored for out-of-band wakeup devices
> - DLL override lost after resume for DDR modes
> - Pinctrl not restored before DDR_EN is set, causing CRC errors
> - Unhandled interrupt during resume causing "nobody cared" warning
> - Various error handling issues in suspend/resume paths
>
> Changes since v4:
> - New patch 3: Fix esdhc_change_pinstate() to move IS_ERR checks for
>   pins_100mhz/pins_200mhz into their respective switch cases, so that
>   legacy timing modes can still reach pinctrl_select_default_state().
>   This avoids log spam on resume for devices without UHS pin states (Sash=
iko)
>
> Changes since v3:
> - Patch 2: Remove unused 'boarddata' variable in esdhc_set_uhs_signaling(=
)
> - Patch 7: Expand commit message to document intentional skip of enable_i=
rq()
>   and sdhci_disable_irq_wakeups() on early return, and explain why the
>   PM runtime usage counter leak is acceptable (Sashiko)
>
> Changes since v2:
> - Patch 3: Updated commit message to explain the SoC IP integration
>   detail about internal loopback path change when switching pinctrl
>   from GPIO to USDHC function (per Bough Chen suggestion)
> - Patch 5 (v2): Split into three separate patches (5/6/7) so each
>   patch fixes one problem (per Frank Li suggestion)
>
> Changes since v1:
> - Added patch 5 to fix error handling issues identified during review
> - Use pm_runtime_resume_and_get() instead of pm_runtime_get_sync()
> - Make pinctrl and cd-wake failures non-fatal (dev_warn only)
> - Use esdhc_change_pinstate() instead of pinctrl_pm_select_default_state(=
)
>   in resume to restore correct pin state based on timing mode
> - Skip pinctrl restore for wakeup devices to avoid SD bus glitch
> - Check pm_runtime_force_resume() return value in resume
>
> Luke Wang (8):
>   mmc: sdhci-esdhc-imx: remove unnecessary mmc_card_wake_sdio_irq check
>     for tuning save/restore
>   mmc: sdhci-esdhc-imx: restore DLL override for DDR modes on resume
>   mmc: sdhci-esdhc-imx: fix esdhc_change_pinstate() to allow default
>     state restore
>   mmc: sdhci-esdhc-imx: restore pinctrl before restoring ios timing on
>     resume
>   mmc: sdhci-esdhc-imx: disable irq during suspend to fix unhandled
>     interrupt
>   mmc: sdhci-esdhc-imx: use pm_runtime_resume_and_get() in suspend
>   mmc: sdhci-esdhc-imx: make non-fatal errors non-blocking in suspend
>   mmc: sdhci-esdhc-imx: fix resume error handling
>
>  drivers/mmc/host/sdhci-esdhc-imx.c | 84 ++++++++++++++++++++----------
>  1 file changed, 57 insertions(+), 27 deletions(-)
>
> --
> 2.34.1
>

Looks like this entire series may be material for stable kernels, but
perhaps it's easier to manage that through manual backports to do the
quite extensive changes? I can certainly tag the patches for stable,
but in that case we should have a fixes tag or specific kernel version
for all patches in the series, can you please help with that.

I am leaving a few more days for reviews before I queue this up for
next to get it tested.

Kind regards
Uffe
