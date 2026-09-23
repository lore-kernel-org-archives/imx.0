Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518E74B7A4B
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 12:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165727; cv=pass; b=CeMCtJaAesnRrA6oObMeyJExJLfjuTiiL1RgJz5MGoE7jpHxMTEIlgXmNREU5jBzcVhxgLQYCYGGYp6XX0vuSKcCN/zaINbtX3Te4WApMmo7AiU0IiZEuHKQuBLp5fgwEr0FayC8wqigrXD56gsIEYbG8x83LbZoognxw+JE3ic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165727; c=relaxed/simple;
	bh=d9LZcickXFLWLLIsYy2cdluHvFFTFr7ZSmT4GmRoZnw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ud1gx/jxI3ijM3aHkCZPdfL2QTColxK0o8PyBx1AnE/i65cnYU+avi38SRUdKT7gnS+vvkUYHrVWNUDN8Atyqg+Nty/7mHqRgcWI2BOz/BeRnSgUHn6TGdT4OaPngkVFeLjoEoRHGVQNCVJag1wwOfKw4PCisPzPdcE1zK/QKS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=maPiW759; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eU2p6EA0; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="maPiW759";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eU2p6EA0"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbYMV3413935
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 12:15:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lUmDDWZK3rMPUgUEQOwwdE/8Cn8EPco7KHNc8Hry+5A=; b=maPiW759OLPqwFnm
	rgKFC2fZdUAWP+Ph+dcaVvKLIbdMUF6nH6PNJ12PrxUR5gGzTjBKq961SGsumfcV
	3vc8ep4kZG/Nd/5KfofJhZ4iXDaySDasw++0GxYZdW8FQAvyBuFw2wCo+i66h+tV
	dS58l1OfoZf0JaHQC/sorWCffZIRVrdYLZmLhqyT9V/Ql1XzLnyXYWrlIE0Eh+Wb
	8aB07/9Yk6UPT5TXlpbg5If3AgP6Wr2w77KzF89c06/fXDrgMAyhxBLR+vH/WwhE
	rYQPcLW7m3SibC6vAuYm8nMIjQxetSio/sr4MDE4VH9WR3lvUzudeaAJuYDaSAts
	UwcLyg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv78n1w7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 12:15:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cec4226c70so7693135ad.1
        for <imx@lists.linux.dev>; Wed, 23 Sep 2026 05:15:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790165723; cv=none;
        d=google.com; s=arc-20260327;
        b=CsRoVHWvmOdGdtfGh5uCvqvhIFsNeUNAcL/AL9QbVfrbCFrsDvCJa71xeonAffsuPO
         cy2/M5JE2S4akPlADEwqdqU3DEHeBYHSM5saykpMtvzqPUlQJOftB6YljN05n1glzQ02
         +Lz6jcDOGyLZEDbHEZaZ4BmkCL/5vYhePutPoAC5qZzfQdoWOrFhMbVeCMOlXaj1QLxr
         A5NTcHqCVtcNkvlBogJD6cGL8poylx0TNDI5voEtSYEnai7mpgDTXZf12EcEZxxuUKoG
         PuVWbLfjoumWsCKfHtSM4+cnBBrSNNJJvlJlDC5SoTuU91pP8U6oITmxAGv4hMmbYgaz
         mtkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lUmDDWZK3rMPUgUEQOwwdE/8Cn8EPco7KHNc8Hry+5A=;
        fh=UjEGw6BsZhYcNdOVWKXOcyWw7zszavXrJ1J8FNGN6yY=;
        b=Y8WHwD5ECxkjbya1qwZiPX8/THqvScYhS35z/eoqzN4sRyrrtP8qtcm+jFKhsiCOpm
         RKHAPaWtLk3dSQimNLwR7OcIh9K/KSh2IloRwlEsS05X1IOS+4BQ0mzRhdzWLzIVTiIT
         x1t2tIHfTraMkhpj8qiz3S9J3l3+afcwJ9eHqVKR1Wgetpmm1aYiJLELgcGQNENRzNTj
         esHT8nk0TcLCQPJhSn7h0AbuTaEsZ/3wQm653vV2AqTmj0A7zM3UPWM5/JdSHCc+m/kz
         L/0NvjWLHi7FpfWrGWqj+z4vx3ZN+Dqu60yacWsaBZFLDqZhspSaNTsWTiF9JJcSlt9J
         1zZQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790165723; x=1790770523; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lUmDDWZK3rMPUgUEQOwwdE/8Cn8EPco7KHNc8Hry+5A=;
        b=eU2p6EA0tX+ElIoTnca5KXFOjWxWvx+Uii6nH5Fc/E6SztFLRbFF9MfEgutDbPN46h
         yURg1UIpFKoDh7L37v+ZS04MKvcwbT8KWSIoXhFndBWa4/52rbC2moddOK7bIDFO7aHZ
         iKeqldA3vJKA3OAobE07bAuTBy19/CL5z6EJVCwB52vei1M3N0gsu76LCmr6CRn6zdz0
         u/K6KTBzABuOOCva/8OtXL+QkbXPu+4Z0oUywP5xGjammuLJcCHMAsNAwKYrXdky19g0
         i+zi8PhPH6kq8Brn9PS372MOod61trJIn8dxvIl6NTW0d811pyQL8yn9BLa1x+NNphpU
         b/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790165723; x=1790770523;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lUmDDWZK3rMPUgUEQOwwdE/8Cn8EPco7KHNc8Hry+5A=;
        b=WxeLy8gjqkE8wB3l8aV+C3c4ua6De//wqAcucgUFBkmjrG7umGEcMmYsOmJkcmNlSx
         qu3DyHNqMiGns5K5CaLQvQaA/X4IxlXR2vm0FoYuornovRMFONpHdEAS0dr9+HGC7r1O
         TxVMwdvzNqOWgSZin8HRZ9AAw924Mjhw9H8rDFrnWoqoKX+TV2e54ZB8BTZKyIUbNXkx
         E3NPkQXr2vp5P8eUrrL25pdB+u75Av11GXzQVtn/Nf/bBYI7J5BUAi3ekTxoPa3bLXGz
         MWIX+n9kHnd565RSs/3KrO95PT3PQI3af7oO5X0Ie5PiNHChbfSCkUcu+HKEjWZO0mLq
         wAAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzo+kTdXuenOCL9K8CXwwvnCaYgZi2yRWMg/BTpaIAO+qiB6Ty9usTz1+P+B3CXZ5sh7sE=@lists.linux.dev
X-Gm-Message-State: AFuF++ns/1Cw+hCmpi1jfXtnrpkrW2u7lHWk5O8tTNa2xj7RdMHy6D/5
	psx9oGBH5E5rIoAGHNUDKM5R0E9LhCk2/vsuZApqVeZfnKVuktLvfirLtyY+aqo4+UmcHSeNwH3
	rif9uREDlfzvtW4PZmY6+iM7vCksFfxrlMmB7HSwODavStPXBCyBOv3pPc47MumddZ3XQWK393o
	AAIIFJErbhbhzgXUbz3GDS6iVFkQn6DA==
X-Gm-Gg: AYBFou0YAt9PDITHWf1RXCcda7Dol96+aoUo7Oi3MO5Z5Ada0nf/xLSeeAsosbtMUWF
	4Al5Yf27WvsBfxgiXRh8TnH2GHLjB9U8+9H+9NbPZpMsfnqWe2s31mpQcrf+IjFprjylxHcMdT1
	As6r8f/LleLXTCQG81tF+F8/SY3Y57ymWeNq+CADAD8XL+E46tQsZtxbRFdyQTM2j77nJ3
X-Received: by 2002:a17:902:d592:b0:2dd:c0ff:e728 with SMTP id d9443c01a7336-2df69de4665mr19055555ad.58.1790165717500;
        Wed, 23 Sep 2026 05:15:17 -0700 (PDT)
X-Received: by 2002:a17:902:d592:b0:2dd:c0ff:e728 with SMTP id
 d9443c01a7336-2df69de4665mr19055275ad.58.1790165716824; Wed, 23 Sep 2026
 05:15:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260921-imx8mp-blk-ctrl-v3-1-c86b0a9d4781@oss.nxp.com>
In-Reply-To: <20260921-imx8mp-blk-ctrl-v3-1-c86b0a9d4781@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 14:15:04 +0200
X-Gm-Features: AcwNN1UBYWIvEZGdzMW9jD4AZ2JktIkSu9xe9i_PSGoqpxzPUfaA-MSKhDFG4Xg
Message-ID: <CAPx+jO_kZp5tRknB6xB5v3Prv=xLU0x=H8VBy9uTdarGHmxgoQ@mail.gmail.com>
Subject: Re: [PATCH v3] pmdomain: imx8m-blk-ctrl: Serialize power on/off
 across sibling domains
To: Ming Qian <ming.qian@oss.nxp.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
        Peng Fan <peng.fan@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
        linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Zhou Peng <eagle.zhou@nxp.com>, Xiahong Bao <xiahong.bao@nxp.com>,
        Ming Zhou <ming.zhou@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0OCBTYWx0ZWRfXwU31IRBlqXcu
 h5fVup2eYpsjT5qmlkTZGEkaX9EHh7xistiPqHxtKqhLG4Coa6Ccm0SUy9gppM5fyDEI3qa2Mkl
 Fc/UdvVpWcBygHij/+vckVEEKgKR8Po=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0OCBTYWx0ZWRfX+7eGkyKDA4PP
 c41XxGP8Et/05a7rGwhmwXnuhnsBVitp7Iz703JCkZQvVk1zcZ3r4V7IqX7uJ+ap2n8SwJux11X
 BdwzuneFhiH5lLio+w35xpVyFN5kHisM32SGXr+j4aBulIgrxKc5xqj9GTO9A1F2s3pFii5uA53
 7EG6mpD6pG9e5OH9R5UgExx4tQN0s6AAnclDeTcvst9LuU7Tvvx6mugb/FwVmU7u3ySCOmL6NfY
 VLezJGbq3HChK3top0CnZO8WTnIxFQJ5jeXcs7JJEz4J0EtPmbzs0nKGTiljO0JA95Mbl5eLfQC
 JdIDwKnt9uRcEzwbkke745cP4gOeM8A45+0zmzmVgl7sohJwvoSy6/BoDGov3SJw7pT4GYAWoIS
 mH9VRgmZlk1+K31ULbPrHtXuZXia2OJLhvc8u68hDupZAXgBipL+gBFflTmzDKE6MsW6hKiwPBR
 E1Bbod5kg+06nwu3k9Q==
X-Proofpoint-ORIG-GUID: hVbH3rIY1HJtFFFfH993QXlPUZuCPjPp
X-Authority-Analysis: v=2.4 cv=aNFlOr9m c=1 sm=1 tr=0 ts=6ab3c2db cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=bC-a23v3AAAA:8 a=8AirrxEcAAAA:8 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=JfrnYn6hAAAA:8 a=L-I4Vr5n3LcoRG0ZONIA:9 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=ST-jHhOKWsTCqRlWije3:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: hVbH3rIY1HJtFFFfH993QXlPUZuCPjPp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230048

On Mon, Sep 21, 2026 at 12:03=E2=80=AFPM Ming Qian <ming.qian@oss.nxp.com> =
wrote:
>
> On i.MX8MP the VPU blk-ctrl exposes G1, G2 and VC8000E as three separate
> genpds, each serialized only by its own genpd lock, so their power_on and
> power_off callbacks can run concurrently on SMP.
>
> The sequences are not independent: they share the VPUMIX bus domain, the
> VPU_NOC and the ADB400 handshake. On power up the GPC cannot ack-verify
> the ADB400 handshake - the ack only completes once blk-ctrl sets the bus
> clk-en bit - so it just waits a fixed delay instead of polling hskack. A
> sibling transition landing inside another domain's reset window disturbs
> that shared clock and handshake timing, the victim's reset does not take
> effect, and its block registers read back all zeros: the decoder times
> out or the encoder fails its format check.
>
> Serialize the blk-ctrl reset sequence with a per-blk-ctrl mutex; the
> driver deliberately avoids a genpd hierarchy, so the genpd core gives no
> cross-sibling serialization.

I recall I had a closer look at the code and the DTSes, trying to
understand why we need to avoid using a hierarchical power-domain
layout, while in fact there is one.

>
> Fixes: a1a5f15f7f6c ("soc: imx: imx8m-blk-ctrl: add i.MX8MP VPU blk ctrl"=
)
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

As the fix is simple this time, I have applied it for fixes and added
a stable tag, thanks!

Long term wise, I am wondering if we should try to move to a proper
genpd parent/child domain configuration instead.

Kind regards
Uffe


> ---
> Problem:
> On i.MX8MP, running the VC8000E encoder and the G1/G2 decoders
> concurrently rarely and non-deterministically leaves a VPU stuck in
> reset: its block registers read back all zeros. A decoder then times out
> or the encoder fails its format check.
>
> Root cause:
> The VPU blk-ctrl exposes G1, G2 and VC8000E as three separate genpds,
> serialized only by the per-genpd lock, so on SMP their power_on/power_off
> callbacks can run concurrently. The sequences share the VPUMIX bus
> domain, the VPU_NOC and the ADB400 handshake. On power up the GPC does
> not ack-verify the ADB400 handshake - the ack only completes once
> blk-ctrl sets the bus clk-en bit - so it just waits a fixed delay. A
> sibling transition landing inside another domain's reset window disturbs
> that shared clock and handshake timing, the victim's reset fails to take
> effect, and its block is left in reset with registers reading zero.
>
> Fix:
> Serialize the blk-ctrl reset sequence with a per-blk-ctrl mutex, so a
> sibling domain cannot run its sequence while another is inside its reset
> window. The driver deliberately avoids a genpd hierarchy, so the genpd
> core provides no cross-sibling serialization.
>
> Test:
> i.MX8MP, Android 6.18 kernel, concurrent H.264 decode and encode. Without
> this patch the failure reproduces within one to two hours. With it the
> same test ran overnight, over 14 hours, without a single occurrence.
> ---
> Changes in v3:
> - Go back to guard(mutex) in power_on()/power_off(): the goto chain only
>   jumps forward to do tear-down work, so it does not break scope-based
>   cleanup (Frank Li).
> - Link to v2: https://patch.msgid.link/20260917-imx8mp-blk-ctrl-v2-1-81d2=
9e907a5d@oss.nxp.com
>
> Changes in v2:
> - Replace guard(mutex) with explicit mutex_lock()/mutex_unlock():
>   power_on() already unwinds errors with goto, and cleanup.h asks not to
>   mix goto and scope-based cleanup in one function (sashiko-bot).
> - Shorten the commit message to the essentials and move the detailed
>   hardware analysis into this cover letter (Frank Li).
> - Link to v1: https://patch.msgid.link/20260915-imx8mp-blk-ctrl-v1-1-b3b4=
e6e7e676@oss.nxp.com
>
> To: Ulf Hansson <ulfh@kernel.org>
> To: Frank Li <Frank.Li@nxp.com>
> To: Sascha Hauer <s.hauer@pengutronix.de>
> To: Pengutronix Kernel Team <kernel@pengutronix.de>
> To: Fabio Estevam <festevam@gmail.com>
> To: Shawn Guo <shawnguo@kernel.org>
> To: Peng Fan <peng.fan@nxp.com>
> Cc: linux-pm@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/pmdomain/imx/imx8m-blk-ctrl.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx=
/imx8m-blk-ctrl.c
> index 479789009c7f..f8105e87ea3c 100644
> --- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> @@ -15,6 +15,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/clk.h>
> +#include <linux/mutex.h>
>
>  #include <dt-bindings/power/imx8mm-power.h>
>  #include <dt-bindings/power/imx8mn-power.h>
> @@ -34,6 +35,12 @@ struct imx8m_blk_ctrl {
>         struct regmap *regmap;
>         struct imx8m_blk_ctrl_domain *domains;
>         struct genpd_onecell_data onecell_data;
> +       /*
> +        * Serializes the blk-ctrl reset/clock sequence across sibling do=
mains;
> +        * their transitions interact through the shared VPUMIX bus domai=
n,
> +        * VPU_NOC and the not-ack-verified ADB400 handshake (ERR050531).
> +        */
> +       struct mutex power_lock;
>  };
>
>  struct imx8m_blk_ctrl_domain_data {
> @@ -98,6 +105,8 @@ static int imx8m_blk_ctrl_power_on(struct generic_pm_d=
omain *genpd)
>         struct imx8m_blk_ctrl *bc =3D domain->bc;
>         int ret;
>
> +       guard(mutex)(&bc->power_lock);
> +
>         /* make sure bus domain is awake */
>         ret =3D pm_runtime_get_sync(bc->bus_power_dev);
>         if (ret < 0) {
> @@ -164,6 +173,8 @@ static int imx8m_blk_ctrl_power_off(struct generic_pm=
_domain *genpd)
>         const struct imx8m_blk_ctrl_domain_data *data =3D domain->data;
>         struct imx8m_blk_ctrl *bc =3D domain->bc;
>
> +       guard(mutex)(&bc->power_lock);
> +
>         /* put devices into reset and disable clocks */
>         if (data->mipi_phy_rst_mask)
>                 regmap_clear_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->m=
ipi_phy_rst_mask);
> @@ -202,6 +213,10 @@ static int imx8m_blk_ctrl_probe(struct platform_devi=
ce *pdev)
>
>         bc->dev =3D dev;
>
> +       ret =3D devm_mutex_init(dev, &bc->power_lock);
> +       if (ret)
> +               return ret;
> +
>         bc_data =3D of_device_get_match_data(dev);
>
>         base =3D devm_platform_ioremap_resource(pdev, 0);
>
> ---
> base-commit: 27953c044974baf7e24dee3e9342fe0103dea80c
> change-id: 20260911-imx8mp-blk-ctrl-c46f26783073
>
