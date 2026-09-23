Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8721A21ADC7
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 12:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165733; cv=pass; b=EhaGKu43qtePvTYYjkNWOiC+OzbwEddBlwi/dcK2gKIZundB0z+LnN/1iOvb2+REqYmW9uYy5tZShJn8Femaz6ICOHDm3jhQ7MngA/uwRfaCmUImCpudgzqRGXGrJZiNEWLi042J8LsyZORqmMybpv8fJpZofI5HiyoK4DqiZiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165733; c=relaxed/simple;
	bh=5KBcdSffm4dlIV0YyVdl2Jl/eg8JxhlguKWSqYByvUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m5/tVBriY+wMDwivYaj1lMriANeVFJA0nH3EF2gpMvIhlkRutbpE3TMeWnfWwGNirvrtjS+4DPbTdPmI4A4pdn5KmK4h6qnusQaj5kIJdLQ+bXRk86NLIVgm0WZYjHJQHI+d51VWzbklLqGYrgrpaB03zSONmU/r4BN1C7lETGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WKz+l+81; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O/eEl8b1; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WKz+l+81";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O/eEl8b1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbVmN3616406
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 12:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xwqrr5YcknBVVx+rZGdCo6L8R95M6EOo6myZTngecug=; b=WKz+l+81SIY+I4oS
	44zECxavKPfTQl2Ns1Sv4L2Pn0/8Um+wFPtB/28MmwIY6yj2odPRvm/KTXW/ek/D
	I6GetvLF6GlwfekM0XS2dvgEy272WAZfO3MXK3ijOSBQw3UxZz5tzmgw815dDdu6
	uptlzcNi4faF0Jn1s7rX68LpQPyYpSPXh2o3PmQtyQfzEYn4P8mtcbZFjfgMSnF0
	P/082aJeYcp84krLOma+xfMW3d/ozdR8bnL6qqFL/5SxQelHa4rf17v0x0VDAeLt
	nmdLdzn2yHYmtmAdVSBWF7qa1spMbHxYrbQu5H5VZ/GbFlN9laX0jZQSoo1BJtdp
	5KIgUw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8649r2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 12:15:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dd7d0751efso6973255ad.0
        for <imx@lists.linux.dev>; Wed, 23 Sep 2026 05:15:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790165729; cv=none;
        d=google.com; s=arc-20260327;
        b=GaaXnS/Yfx06XvRsRSkiK8Ine1uWdNWDVNDpsdupS8Ny/F/IWFL8Mgx74683vItVrh
         t9OXSQFf91CvkNVc//qm/baTiJKZSrmnGKc5IEY8zP9WciJH5oizDniFpDT+qQ1Jpmja
         F3v9E/HfycwRhUVgc7A7pBkQRapNvwgOxC93ZxhjwN4J8SXeRD8jzbL83cTcWjXtn1/A
         hHuFEdk/HJ5J2ViHlzF7YI1w3PUTkLtYTtLdc7bAzRwUkzBt20SIgN8HEBxlbOZcYuMo
         RdPi23XflpUFbx1lpVpr6DKL3BEBYtC8cJgmiUM6g9Ioq5ldgJOnpww0tW3Y0EV4CeA1
         sp7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xwqrr5YcknBVVx+rZGdCo6L8R95M6EOo6myZTngecug=;
        fh=kHcrkRhk12si+EMpcG1Acs5HCKfMo3U+n6eSofa6s+s=;
        b=YRJggVuFIV8xfcTJw99cbuot1kBWE4F11KYtHbDcU0oOOM3/Bk1kU7OsC7jmi2/+F5
         YdaFVIPmfKiFobqNBfpPyaOiLFgPLK98xOENR8Ib7oQCPHRyhlnl97zbkxybwmEoK2Om
         ZzWoYcODwT6enLvhZwd2Irgv/oI19xN/ZXJizxkLJ5KQyS/aElA8qpQ2iBceGsNxdLjA
         tS4RcXd5R3A5mastvDxJ77TFsXj1Ce6T41YuJ9hbyvsOfL04/8P1H1TQDH+XdIB605Ld
         LA/J2oNKV73CbNU6SY/v8lHCblXXb6M0Jms7AP0Esibksm+s5iZo0waTZQslt/Ou/wMp
         Awnw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790165729; x=1790770529; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xwqrr5YcknBVVx+rZGdCo6L8R95M6EOo6myZTngecug=;
        b=O/eEl8b1wX2NQFvUvLuvel+B24N3FWjoolU3SUcJut1jAwN3Aj4qAtHRpIUm13WEBr
         ts4ZTRpELWzHYaOKLhEzU+3cBrtTq5z7F8226H38vblM59+Gz1XP4LyskJsGcMY/G43E
         vqrh3sXdPPFpZjqJ94DA6e7RhVmOGz9JdqqKxjl7xiJBFrWlmow9fM91ANNY8YT3wUb3
         4X6cZvjuNhid95PIF4a2t/wvvx1Yaw7ZLdXfVapO/AVHgHci7301S9PzDoIE7qr00EoO
         zQVxV2JHS3GTb5C9On9r9KuACNuku468TkA+USM2XhNgyIMAdsXyzwHZopuSLmNsOU9x
         Pl3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790165729; x=1790770529;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xwqrr5YcknBVVx+rZGdCo6L8R95M6EOo6myZTngecug=;
        b=ot2D9iLARtA8VZ+y3t9NfU+SgQ5IIIKTvsI2/Lu6NGW65VjNAZyD/Vfdmw/ECVh18U
         f6S560VK+MBq/hv+Mz2zr3/JOOldR8iO7R6y6+UZDuhF5EWRpziuXzY39RGbnsmt9Xwb
         Z+7G7Z/afrti5rwHWkfoGfNoBPxybc7Spay5ucDvKaGs6dNFLfeqcVhucwJm463e9kvB
         giYiL+yWLgyliE0fQiUSLe48/RsVD+taF0pAzgQElnXM8oNR3Lc6bu+1pBiOn0RFE8C9
         CcyULIz7OHt0IE7G40mlJx4MCPrsl9Su3pNu0o9GvuxIRnEZjieb/Nv+xWKVPXZkWntx
         yDYQ==
X-Forwarded-Encrypted: i=1; AKwUvByleFddSD5HE0QyrBwB1rBcEVPZGigEIK4u7QdkmRGF8LA3Uv7qNtmAocPgcRCUo1v3xAs=@lists.linux.dev
X-Gm-Message-State: AFuF++k8zJGEZwE1vCm29iibtf09FsRUdiimhJUv/l1nWG10m4Mdn1lV
	QPjjNndpMqONokXHSNUo+PL0QS9/+fTUN6RGWzdI9kWYGx3DIYpanCiSfgn8zQWgCcv+/qRpIRe
	skdeKTN60W7INdi8P7kZte6Te86Kcm+qQdEm+mq9W3YUShGEShoIG996FzgUKZpGniVPKLzLwiI
	lCfS8Ekl3IFiFOdMxLoFpcebAcNJoT/g==
X-Gm-Gg: AYBFou3k/b22zKKuLXv2tYYGUGVWs0bXaYISHG4Aa+yVO8GB2yJmfihoOifYtlQWJLg
	/IGJvH1HOgwy9WXdFNtKDULSXJpz8tcR9tQ8fF5v3f59U49T/Hl53svFwmktqsmOfuq02BGi7Jo
	bleo3Id+TNMcYPzozRbWAb1khMJBlk53iR0l0iGeWs1WXwDXz7Ispfg9fXcmPnaGkOwOBR
X-Received: by 2002:a17:902:fc44:b0:2d7:5da6:2af4 with SMTP id d9443c01a7336-2df609dab94mr31313055ad.4.1790165728658;
        Wed, 23 Sep 2026 05:15:28 -0700 (PDT)
X-Received: by 2002:a17:902:fc44:b0:2d7:5da6:2af4 with SMTP id
 d9443c01a7336-2df609dab94mr31311365ad.4.1790165723390; Wed, 23 Sep 2026
 05:15:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260921033708.14433-1-phucduc.bui@gmail.com>
In-Reply-To: <20260921033708.14433-1-phucduc.bui@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 14:15:11 +0200
X-Gm-Features: AcwNN1VsaeqV92H7KEZC7boQTZb58RsMU14eBT7KgfgQJPOV9CTm7Q_Kcg0tGjo
Message-ID: <CAPx+jO_RAw54HMsgCSaxghtgakJ0rANSY-WY35SE1i766mMsvw@mail.gmail.com>
Subject: Re: [PATCH 0/3] pmdomain: imx: Use pm_runtime_resume_and_get()
To: phucduc.bui@gmail.com
Cc: Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, rafael.j.wysocki@intel.com,
        Jacky Bai <ping.bai@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
        Peng Fan <peng.fan@nxp.com>, Xu Yang <xu.yang_2@nxp.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Ming Qian <ming.qian@oss.nxp.com>, u.kleine-koenig@baylibre.com,
        Marco Felsch <m.felsch@pengutronix.de>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Guoniu Zhou <guoniu.zhou@oss.nxp.com>, linux-pm@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: STIBuWgk5OLl66ko7M_sjetJ_ykYn80Z
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0OCBTYWx0ZWRfX0bV0T1pXQj+O
 srgLUC+PkDOCDlBC586q76vs+gbEZPBQz+lvLEAKdOagQgv1TkAJ9bNvUwImmGFaMEeUYsaiXfV
 PJVHjmEtPrrmfZDX/CNGh/mEht6w6l4=
X-Proofpoint-ORIG-GUID: STIBuWgk5OLl66ko7M_sjetJ_ykYn80Z
X-Authority-Analysis: v=2.4 cv=eIOGH3p1 c=1 sm=1 tr=0 ts=6ab3c2e1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8 a=B7rF2LB79GkdTgAebh8A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0OCBTYWx0ZWRfXy+HzmicDJ8HX
 cGjrp09CoRwQRi6Xmk6iRhPnTlG4NC8j+XrPiqqXTnj3Y0sBla+lX1tVMTqYZ43a8IaXp2Vq9VP
 ikpEiFssiYU0pm/U2dza4BahO8XLJDuvTaHVoTGgjNsRrKlPqK7p6tsrKLhHviTwS+xvZDmm454
 ddF4Ojd1q0C5YEPZxFQsQRNlID+1wW8pELWyrzFmagjHNBgWfz97pP0keEsBroDBJU/Iq2vHuua
 mmkF1uSoJo5QjpjTKSOIJpt9Iu5Splt8DeusZbxGrf3Cqp5juW2cyqn7fCezi63ajKTuoys+gpV
 cZTAGwFtlT+62Z78hEHmzT0SU9JnetQW6GcGZphDAt+ptGnwrNz7V4UK1xHy4zWwL/DWN9cMC/3
 LaIJYB+hAANW84qQREhe4tBTCWshZ4MRumYWnYeHfiWSV4dPJG1AK6x45eXNoaUmyJ90D3aMQPt
 j6AT/+yMTLzi2a1asuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230048

On Mon, Sep 21, 2026 at 5:37=E2=80=AFAM <phucduc.bui@gmail.com> wrote:
>
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> Hi all,
>
> This series replaces open-coded pm_runtime_get_sync() and
> pm_runtime_put_noidle() error handling with
> pm_runtime_resume_and_get() in the i.MX power domain drivers.
>
> No functional change.
>
> Found by manual code inspection.
>
> Best regards,
> Phuc
>
> bui duc phuc (3):
>   pmdomain: imx: gpcv2: Use pm_runtime_resume_and_get()
>   pmdomain: imx8m-blk-ctrl: Use pm_runtime_resume_and_get()
>   pmdomain: imx93-blk-ctrl: Use pm_runtime_resume_and_get()
>
>  drivers/pmdomain/imx/gpcv2.c          | 16 +++-------------
>  drivers/pmdomain/imx/imx8m-blk-ctrl.c | 15 +++++----------
>  drivers/pmdomain/imx/imx93-blk-ctrl.c |  3 +--
>  3 files changed, 9 insertions(+), 25 deletions(-)
>
> --
> 2.43.0
>

The series applied for next, thanks!

Kind regards
Uffe
