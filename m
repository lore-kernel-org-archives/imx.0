Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EA44E50BA
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 14:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789742643; cv=pass; b=qz53TpAwX3lsrPJVIGUNpCsk3W3BngJ5piLaZgYqD1GvsMo3ip33toyCnS8M2f8O9IuY6918okjGD4KFa///n7VTkvCKVIz7Z8FcBbsYao0wpOKKjivhlJFhirLeqn8KNuD/IGjsWgh/OyQxpaQKgrcXd+Q/vc5D5kEf5uVilH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789742643; c=relaxed/simple;
	bh=AcIVnsv8+2abkkPu8NU5Qxz7g11MxL22mpLiDkD0gKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q3FDp8oN/r6pPHK8t701vS6ofYQsU5e1KG7sAFDxjatfuNlSCteJDtNbqmNuQtofl/BGX75/vCPA9ydwk2Yy4wqVLGtp0gkM+QpAEbOHIx6pAkrAYoaY+3qDwt2yfmFZwoqbhj7gqr0B1oZ1m1DsiWgLDA5WnVpwhzNRdYEONhI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ev7OIqCy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PPkfIcpi; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ev7OIqCy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PPkfIcpi"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOowS1202115
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 14:44:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=W6tY/LrwQ6+wUFwfZF6CF5RRZwGXtm3/veslsZpmF+Q=; b=Ev
	7OIqCyObUjNIYqgsGclT+aFxz83DUJ5JXZT1YC6XQjxLTh3EEaGOdepPGd12JWPt
	sZhx4jpPGdr+yz3nJlvsx6/AXs0kGN8dhvgOuJnVPciG6jzrsoJWgWWnPhPsIxf6
	3GiYTYXTEMqGC4s8SoIIlq2bZTOOD8HFMPeqkNED+u/EX62sCxUgBWabe5hWda6H
	D5yQZU2fp7T/7D8zGS2ZTco/Dqz5b6+B/Nn00miVFLDHq46FqHcbpzmLl2uA82CZ
	m68Mrfof4f/gOFIrxUyH/q02GBWfffLXvKzCw+6k1RwHJBACJHECKXRIR8CaSl8z
	3WGR4a2+Km/YB2IyJF7Q==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grxp2t8fp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 14:44:00 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6c1b24c4d0bso1103008eaf.1
        for <imx@lists.linux.dev>; Fri, 18 Sep 2026 07:44:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789742640; cv=none;
        d=google.com; s=arc-20260327;
        b=MDSvdcbPD1gT0qxKIXhcAC2iWnfvLwvHJ7hSNo/zoutLyu5VLUewCTI5KpIwvTdtl7
         boxlF9lGblToQcWlYXwyTI7KUxDJ0v53YpDscpjxhSn8jiHiwtNGWx21ddecISDON85E
         TC0gtxnEuYUVq1YgCBh7XYC46vVXdd8USUVQmYLcScnn5Hh9xWfF10joAygP8iBah7kz
         xDe23K3A1VIuEuyREIAIv+2Mk8Ee8Klcy5U0Bj/JXF/l3NY+kOK9qvCowg7W7214A7y8
         lsOl/iChaORckV0PsTB5oGhn5cG0gwqAwP47Jomwh9MgTiuiz9/hmYKZKpyafhonWkL3
         2AwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=W6tY/LrwQ6+wUFwfZF6CF5RRZwGXtm3/veslsZpmF+Q=;
        fh=vxvQ/h9mJfhfahW9bQN82axeG2augYaemfOJ8788VsU=;
        b=bjAP8tYyn073teC97uVrk/5Kr/Yrq0FbUPPMjxhFAUAAfrkX/46pkFF530tYUgR+5F
         8YRUuOIu9GMOx4PpFzfN/nRpNKlzpA8RvtZLq+FX9rkHCdOf9JxcjnDUvAGetuMHbUnt
         o8tJqLEH0G6FYkkKIC4MGyV0o00Cea/Ukff0cDK3fE9hzx/g3ofWbQe4SFU68Sal4xzJ
         H35hL7HnhJOn/xXCEwFowxYzGXykgbKgaK0S0/YcigALSbjwfsbwFTw80TOmh09DEJHB
         hOVgh0uF+d5NH+JybnieTIVbVxXgxh9JFEgVLLqMFVGs5IkZiat4KR1fqSzkbFSDMJZx
         9D2w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789742640; x=1790347440; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W6tY/LrwQ6+wUFwfZF6CF5RRZwGXtm3/veslsZpmF+Q=;
        b=PPkfIcpiBMwEJlFTyhwyqo7SaRUyoQs/R+YxZSAGBj8/5XR4X+1n5+dHvFDSLBcV2I
         aS84IFQadVLeG+FA1itNE4xSt6G5qgoq36IOZfX0h4u+iIXbK7XqGf+8/XQsWMqQXKmm
         jpZWGxpJdJNaAQ6uzs5zbHqV7t1zjSMHJ/JD2q37Ac1+hfnMR/JXt5EOPNGjvl+qEXZ6
         98hO83Tm34APrtCp5V7QCy9yLNBoBNeS8zf4Eo1s4kqbSFMi9Wal+ndyU0pv5j7CsatW
         Ep/cl9DIYqlEvWYXHj2RppMPDokpJpqklIF2WRiOx57jmr+HN0Uzx6lfESB0dGzYAGcr
         iLVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789742640; x=1790347440;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W6tY/LrwQ6+wUFwfZF6CF5RRZwGXtm3/veslsZpmF+Q=;
        b=zqVqpkREqWXScgk+tYXrO7l2U/LwXa9h7+35+COAXm1JGPxqTu4tafNkQfH3ZDlXhX
         GdOYb3HNncTsUMIUYcmI47Y6AXcZ/Rx3LPPBGKPEFq3o1vhUUzhnvHt5Qjop043zmEyJ
         m8ryfbGTOPXd3bHYZ6Mz5pdJz0dvCj5RSCSpp0mILSwMVddPc5jNOF0e9yXIVA8Gp5w8
         wY+415cUOkV1fxvYkkb9annCka8/o2JyjLXUkuWBdmbxiyTuvp/D/deSuN2U/vPQKsBx
         /8Df/U/lB3hJF1uEsMBVI17sXH87dv8F/XLn6WGahm3vrpg7huzADiQGMqbKJeiZ6qeP
         9nqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwU4qED2sZKQZAggXFoI+iMjkVVFyPKX5tP1D1dpg8lFHzBsF9PH9tjh0+kDEhPT7qfXLg=@lists.linux.dev
X-Gm-Message-State: AFuF++nPSaeBgIhWpxyXfHvc2qA0F7NHdSuf0zNLU29IYCxzJUGP8/s9
	Owa4RiU8Jqj9yLtjNZ9SNijS3ZBLIvjBVp0e3MvdqHwe14/tYNS1KI/vX7jrEc6KH90dac3R3IJ
	zlZSFIDjueiXjarclSaYGsAKme4ndBHXjyyZ071FuGrXwIwCapPpksBSo1RzQzbaq1dpw7KdfmI
	NgTDL1fM3lunbXVb7oM+SeyxnZQh0d3g==
X-Gm-Gg: AYBFou3Eecf8WuTX5mwMzhGhhm1LFJS1/+6bWELi+wnHeNibjny1TSpT0RTT1HSpJbk
	Dv2HK2P6xOgPk89D9evX+DhT+nANGOMR1gJiP0+fVM3Z+TzhmRe5gVfV0O4jGcVEe/ZglvUygdY
	cvuwEAu7efANnBQcg4JeWCYd3Wi3ypaljxZhybAeiARkNaM3O7fGPeNbmL
X-Received: by 2002:a4a:e908:0:b0:6c3:42eb:ec22 with SMTP id 006d021491bc7-6ca9a74fec8mr2397343eaf.23.1789742639911;
        Fri, 18 Sep 2026 07:43:59 -0700 (PDT)
X-Received: by 2002:a4a:e908:0:b0:6c3:42eb:ec22 with SMTP id
 006d021491bc7-6ca9a74fec8mr2397308eaf.23.1789742639405; Fri, 18 Sep 2026
 07:43:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com> <2104f437-e960-4e55-b0e1-2b37126e8c2f@oss.qualcomm.com>
 <82a72918-7bc7-4e2c-892c-0dcdd6dd5548@oss.qualcomm.com> <3f51bf6c-5318-4e32-a1ca-3ce8cf8c4ceb@oss.qualcomm.com>
 <20260918-roaring-bee-of-acceptance-50a8a9@sudeepholla>
In-Reply-To: <20260918-roaring-bee-of-acceptance-50a8a9@sudeepholla>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 07:43:47 -0700
X-Gm-Features: AcwNN1XOxS8g7aUV7HRRWF2PBl79h7D0NcKpS9p8imqdtEwjj4hgkc90NvRmmmI
Message-ID: <CACSVV01N8v4kfC0S8YZVUmyOvWcSKX0jFax4_S6vTpbB11X4HA@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIwOSBTYWx0ZWRfX/b5nhacMq8+k
 O+viGQQtBkiSBbWp0vkNYG9gNFQO2Blvhjxcgf93G9stN/XgT2jPb2c7+Onmuwu0mVf7Tshighi
 U4g9exz8Z21m5TAS1SO5HpMcoe5Jxac=
X-Proofpoint-GUID: KkAMR50H0CThgDw-WdtAnELlI4vFkUBG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIwOSBTYWx0ZWRfX1zgOz61cs5x7
 BelazFM9tLFoyia3vgg/1wzrh3gPmVEDjSfR2urZWvR3PoXACIdOOnjFv2luRUTxwvZKtSWMjiX
 ZU3cCoENG8Iw3pNTLFJQJnxvFrMdycyhsXREZUahYT9vyyl22SSfVpRWv0JZ6D/al/0qdo/risb
 tHioAk/wAG9KcqBEheSEG+GS1zMfv406QN/jk0yYEWF2SsoFBL7XGYMYS1nIDD75q1Jb8kBezYe
 ejUoJ14tlpCwrByg+zR86FKKmdOaJPFyy9olGZvysccunzUYsdlYt9ABij6/L4SkikS7dRTeevI
 Ufip8chWaUZXBIvzux0ioSqRPGDf81aha3SYXwT2g4TAQuM7SlcbAmeupmrR6tffy0HhXYs2H+2
 AJeUClgE4CSYo1Rla2ntiKhv9TEJ9dZwR0r9J3hrcHJcIifKkrOpLZde8oX+eDWR2Gr47ZjkK+I
 fphpB6F06HQRMZrcQjA==
X-Proofpoint-ORIG-GUID: KkAMR50H0CThgDw-WdtAnELlI4vFkUBG
X-Authority-Analysis: v=2.4 cv=cNF1IVeN c=1 sm=1 tr=0 ts=6aad4e30 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=CY0cOUppvrph7IambT4A:9 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180209

On Fri, Sep 18, 2026 at 7:10=E2=80=AFAM Sudeep Holla <sudeep.holla@kernel.o=
rg> wrote:
>
> On Fri, Sep 18, 2026 at 12:13:10PM +0200, Daniel Lezcano wrote:
> > On 9/18/26 12:02, Hans de Goede wrote:
> > > Hi Daniel,
> > >
> > > On 18-Sep-26 11:53, Daniel Lezcano wrote:
> > > >
> > > > Hi Hans,
> > > >
> > > > thanks for taking care of that
> > > >
> > > >
> > > > On 9/18/26 11:29, Hans de Goede wrote:
> > > > > From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > > > >
> > > > > SCMI client drivers already describe their bus match data with
> > > > > MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to =
consume
> > > > > SCMI device tables. As a result, SCMI modules do not get generate=
d module
> > > > > aliases from their id tables.
> > > > >
> > > > > Move struct scmi_device_id to mod_devicetable.h so it has a fixed=
 layout
> > > > > visible to modpost, add the corresponding generated offsets and t=
each
> > > > > file2alias to emit scmi:<protocol>:<name> aliases.
> > > > >
> > > > > Use the same stable alias format for SCMI device uevents and sysf=
s
> > > > > modaliases. The previous string included the instance-specific de=
vice
> > > > > name, which is not useful for matching modules.
> > > > >
> > > > > Assisted-by: Codex:GPT-5.5
> > > > > Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > > > > Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > > > > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > > > > Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > > > > ---
> > > >
> >
> > [ ... ]
> >
> > > > >    #include <linux/bitfield.h>
> > > > > +#include <linux/device-id/scmi.h>
> > > > >    #include <linux/device.h>
> > > > >    #include <linux/notifier.h>
> > > > >    #include <linux/types.h>
> > > > > @@ -951,11 +952,6 @@ struct scmi_device {
> > > > >      #define to_scmi_dev(d) container_of_const(d, struct scmi_dev=
ice, dev)
> > > > >    -struct scmi_device_id {
> > > > > -    u8 protocol_id;
> > > > > -    const char *name;
> > > > > -};
> > > > > -
> > > >
> > > > What is the reason of converting the char * to a fixed array? That =
limits the name and may result in truncation and potentially name collision=
, no ?
> > >
> > > Because of how modpost works to generate modaliases inside the .ko
> > > any string buffers in device_id structs need to have a fixed length.
> > >
> > > So the truncation / name collision issue pretty much applies to all
> > > foo_device_id structs in the kernel. People should now to make sure
> > > that any strings used will fit inside the fixed string. And I would
> > > expect the compiler to warn for overly long strings.
> > Ok, thanks for the clarification
>
> Not related to above topic, but just wanted to check with Daniel if this
> solves module auto-loading for you. Was there someone else who was testin=
g
> this series and was having issue with earlier versions or its you only
> Hans de Goede and it was with v1/v2 when Bjorn posted them. I remember
> something vaguely and couldn't trace back all the versions easily.

I'm using v7 on glymur slim7x, and it solves the scmi-cpufreq autoloading

Tested-by: Rob Clark <rob.clark@oss.qualcomm.com>
