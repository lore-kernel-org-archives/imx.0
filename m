Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C58339EF27
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 09:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784106532; cv=pass; b=sPJ6ktP5qx0PzlsmpfYlYkiUa8dnDbPePq4SKE3NCpNSv6+grobXRc172v+oAG1iYhFF0Hn8/VX0pbWBoFC2EcXZrQduehczLMflY7WUi72FF2mEqKHd78GwqeElGVLBRcmgv0iOQTZ9n2xACzeM+DIXZgIjxK3CsVN69Frk+ls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784106532; c=relaxed/simple;
	bh=/AcugW1SLtFJv3o/LPDOfTqhwLEWDGNKe87L7Mxdy68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iZZ2tiClScVX3tuE56eMwjj3VVGM4BKbGK3ru3aGwJRRTqJQl6Owh05a/ngeKo15rgrlq2+yVbsgiWKsxIqlMWJ6M2EPXg/rxj0zfvHvOuhqdvALksenCV1WJ0SeLXRmWa7da0JXjxfDuCp9LoRoRMuk0lsTD/yOiFzsABvcVVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MjQO47h+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H4OoH69N; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MjQO47h+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H4OoH69N"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3l4bl2269547
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 09:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0s4UvEQjbDQF2ld7XgN78VAO8eHi8w7IlIEUGbUVuOE=; b=MjQO47h+G/ky7ZP/
	j8kG6VyYVGzZFEz0WuFuA2LE+aszAqo8E9xYzqvtH/YTc0CVYIcrbQUDuTaWtTOe
	5x/Ik2Q53EXNmQNwh75UcicAiWj7r9fOCRfiqs1A5Ix3169JSJ1BrPO/gXRKlbTO
	CQgbl5qUjuMFP9sjrGIS1TctXo0sLN852Tn9f/kkx3jsWF6QdsaGD+IPjsnpsjgI
	UweFeqhupPuq/79C1BdHUIQVST98Nu3PiznsbWFL8oPbkbaWHc0tn+kjXXAVIU5B
	hmusFKhgTHekiZSeY7vtZxQ6z+00N4ljAIP+iOzuf2A9b2dHr7F3JntliOgYj3qn
	A2LVYg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9mjvex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 09:08:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1eb52e1fso89226201cf.0
        for <imx@lists.linux.dev>; Wed, 15 Jul 2026 02:08:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784106527; cv=none;
        d=google.com; s=arc-20260327;
        b=qoDp73c6Gj1PFj2r3MITVCh4ymMxuKQfQsQd+sH7s5n3FGMLzG6YFKJPvi9+FP3RP9
         yg2ZPkvni2MgdpujWOpF19UtS05qcc11Z2+sqbLvI6SqWhM8t0hv7vIOsJ1fwNtvH7yw
         zBc+x8Ugz/mngHgpEG05TsdKSUkOez5RkL62tJtWPX3WUm0txwKCR0Fyf5xV6Se4uOkU
         o7+wTDreQGfZsu4CREIb3xvOOmKCP9czKEpKzCzyFTtY5b+oLZVoSvuxp9rsAvgJ5YTY
         sLLddzpXAVSsZLqCa5bq5p6u8S5bALFTeQvk3YanequQpvBxs+kcpkoba9Q+n2FkoJVX
         LHoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0s4UvEQjbDQF2ld7XgN78VAO8eHi8w7IlIEUGbUVuOE=;
        fh=taw++FSPNGr6IuTx/0o/JFAyLqn+HM0s2dg2DUtt9yI=;
        b=a4gAL7QD7Uhvsvsp3H6EUQmmbR9fg/LHXB6UR1yGOB4ePfk5SqwWGmgfygZ/7f/19T
         IGQuFA+YnPnqRaFtawQzYnKJfMPmCqFDxgwopIZWwHWGNbNmDmxd7haEM3nqiFbg5D15
         +9V7LbHxssZJK2FtmOzph2Pi+g1nDqZxM4eMbdvcT8bQxQjR1dm8v5BEX1PhqEqlxETl
         l1xI+aY+yFJdvtDIDCoSmD7R2LxXbypRhJqocVczTKW947Xp82qFIfKLgYvsQgIkSg2d
         qcNySmxqQWr3QUT26/iIHKQUsYLBPpdb65pEEJoZCc1JjIQBubZv4WL9pOg1MboWRetz
         yRbg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784106527; x=1784711327; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0s4UvEQjbDQF2ld7XgN78VAO8eHi8w7IlIEUGbUVuOE=;
        b=H4OoH69NE6gy77lzR7Gs66VBcw12etAWLnNNUPy2tqefK0zX6WBMw0j+X7yHA8G5K1
         t8pP6szfB0Dww9lRY3OGp5xZ2jLAb8jaGChGVzT66P2KpUC5GNAOaLd0KbQz8imQRz3+
         YvklDNF762SXqbGP+LwbuX46HmTW9qv0IfHX4Ab91NHQM80AIsyzDJvLPJcwO1mcnyWb
         ogyPVt/4I1njq+BS93ahTcaYplQ0WafrUISifyX9+RaXHBTiCQN3dfyqOJDlyBvqge/X
         +vqC8IexdoPbK/Z0d1XSOB3fw3PdnoTLUGZTCRU05yqsg6lXCLgCskji+cpYXwtuzk60
         o7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784106527; x=1784711327;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0s4UvEQjbDQF2ld7XgN78VAO8eHi8w7IlIEUGbUVuOE=;
        b=o8BadfdS24ywtZHkrp48D6JId6jDxZSYO/PLP7368lU0qwcUKS68asuDg8mPombJud
         OOukeyhsmBtuX69giPQ5Dj+SSpMBjGsSXYBTp3lihTLYfQTQtP2Bn46UBfE2TSwg/LvY
         8xAKMBHEDg1Y0tP0NnB4buxTSvEX32EwZMu9IA4V6niAvXVZBq+UuexVbb3uXio63URx
         Xb94+jeqybnMCOud6/kIZe1Xeb10Yp/p6dt37D//CK/5EWlGs9ydbFVn1SSWHxu309lR
         G/2D2QLBWzhMNgVWIWXqoSxIDm3rxFvJTB1szhsyT/bRmZ3S4bIio2hHojK0DXnzznjK
         WzuQ==
X-Forwarded-Encrypted: i=1; AHgh+RrxhBP8/gw3lY9kWOIOHG1e3ggEWY8c+7dCAL8gAPoXigZdUnj2uWyludniXhGJWUqGUgU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3v317kNdl5sAEg9PDXSQbX4oW2NDJbeE6DPijq0fCuoFL0JGh
	zi9Ros3Me8z4Sqk33L+Nns/5D5562Sw1FlXeQdohkX34QIKH8Kvd5BDTGDxQxYhvvhL6i2bp20F
	oTkIsPwu0be+cqt+93ZhVGl4y3BUh7Ucf0u81Ne4XyaJDEvKiImAo56mc8wCf4B39by2MfaN6PR
	MIZwPHaNmk/Zp7b4cVxLbffPU2/ADA2w==
X-Gm-Gg: AfdE7cm6G9TwivzI5ipC32BBh/rRUv92NMByN+wOJDxTg9PSrd0g5WHQy0qMi3wlSwN
	ofXQoo/mk9K/9eXqq9kqF7WnCs4fljHAnzK0SVWcY2QJZrRDe7sH3mOLEXPcDF9K6GvoAWhnnM7
	FTuSaAs0POM+4g02H/Kh4cK4sl7wRFwvVFLLRsw2CNf0V3c73KtcJqLXmxdVR98hJsKHg=
X-Received: by 2002:a05:622a:124f:b0:516:d612:d1c4 with SMTP id d75a77b69052e-51e4f0a754dmr18899731cf.52.1784106527429;
        Wed, 15 Jul 2026 02:08:47 -0700 (PDT)
X-Received: by 2002:a05:622a:124f:b0:516:d612:d1c4 with SMTP id
 d75a77b69052e-51e4f0a754dmr18899531cf.52.1784106526991; Wed, 15 Jul 2026
 02:08:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715071818.272318-1-ziniu.wang_1@oss.nxp.com>
In-Reply-To: <20260715071818.272318-1-ziniu.wang_1@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 11:08:34 +0200
X-Gm-Features: AUfX_mw5_zd7FHkNF2aqrnmGS08lBZtf204AnFVjvOZno8cszHuFFX58iO0JEgc
Message-ID: <CAPx+jO8LALFoiB+7JkNhG9D3e+DN+D-iM0qL0T=UAw=BTouN=Q@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] mmc: sdhci-esdhc-imx: fix SDIO suspend/resume issues
To: ziniu.wang_1@oss.nxp.com
Cc: adrian.hunter@intel.com, ulfh@kernel.org, haibo.chen@nxp.com,
        Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, imx@lists.linux.dev, linux-mmc@vger.kernel.org,
        s32@nxp.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA4NyBTYWx0ZWRfXyTO1heYy+ILV
 ngFCKZ4OG9N/WkyivyWfh7i2Q4wCYlRypfp+dB+AS1uoO8Zxc1c4IhdUEfVgnBevSwnshZ7Anrh
 6kkSPznVO2O+DoHyOaoVSQZb+QU6VpWUeOk9bcXFs1W5i8OSQSHqmFOqABkIpAGAXhYKiJgRyNA
 XKahtWVnsMZGiGyDyNJ41TGZnyNv+4iKNx/OynN0KHeruYWiupBDRLyGkI4OYkTvPHVHWtwjT1K
 DmsL5q03os6AZjWA/p2X/ddIjNWr2otUNebEPIWpiC/JE3LQdSXiRaiXA8U7qPxMUv7ROCUIsu2
 qlP7R5Utaia10b4Nqe6J0/DnuoOgnbDR02TCFuaS2OL7UtnhhltPvMNt1xOlYsLq4yns4DOc3Ok
 Wz33BsQ7zeuX6aKrPk7y4Ebj4ExaJKkaRAFVR0pyXcn623708U/E4tJzHuxyUPQVsronLx6SdXC
 PGWwAuBzZKSk1Lyf4rw==
X-Proofpoint-ORIG-GUID: SYguDT2CMt7N0s6klnIRN8bEkPRSOhq5
X-Proofpoint-GUID: SYguDT2CMt7N0s6klnIRN8bEkPRSOhq5
X-Authority-Analysis: v=2.4 cv=E+79Y6dl c=1 sm=1 tr=0 ts=6a574e20 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=8AirrxEcAAAA:8 a=j4ls_bG9junj-QLuZ2QA:9
 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA4NyBTYWx0ZWRfXwWzhdtC0ai0A
 sMP6eczhNV+plKwcQlRcDq8/fDLQz6qOu8lvlcFgr1bW7J2c0rf/8LR708eBr3avg6Me2d1oDZK
 VSguvoWX1i6PGgUE3/1eDgocXzS38AM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150087

On Wed, Jul 15, 2026 at 9:16=E2=80=AFAM <ziniu.wang_1@oss.nxp.com> wrote:
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
> All patches now carry a Fixes tag pointing at v6.16. Patches 2-8 fix
> regressions introduced by commit 676a83855614 ("mmc: host:
> sdhci-esdhc-imx: refactor the system PM logic") in v6.16; patch 1 fixes
> commit c63d25cdc59a ("mmc: sdhci-esdhc-imx: Save tuning value when card
> stays powered in suspend"), also in v6.16.
>
> Changes since v6:
> - Patch 7: Drop "ret =3D" for non-fatal calls (sdhci_enable_irq_wakeups,
>   pinctrl_pm_select_sleep_state, mmc_gpio_set_cd_wake) so they no longer
>   touch ret. Call them directly in if() to keep semantics clear and
>   avoid any risk of a non-fatal return value polluting the fatal error
>   path. (Frank Li)
>
> Changes since v5:
> - Added Fixes tags to all remaining patches (patch 3, 6, 7, 8) so the
>   whole series is properly tagged for stable, as requested by Ulf.
>   No functional changes.
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
>  drivers/mmc/host/sdhci-esdhc-imx.c | 91 +++++++++++++++++++-----------
>  1 file changed, 58 insertions(+), 33 deletions(-)
>
> --
> 2.34.1

The v7 series applied for fixes and by adding stable tags to all of
the patches, thanks!

Kind regards
Uffe
