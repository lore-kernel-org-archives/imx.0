Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC32B3BB675
	for <imx@lists.linux.dev>; Mon,  1 Jun 2026 14:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780324068; cv=pass; b=XWNbjiTuf6V2dbW2sjGJhTTUdYXiAprIb7I981Y2mc4dBtTBA5XIaAvjzO5ANA43i8PioFerKO3MeaS9G5I/+qy9PRWY5SfrzLIp277O84XdiUfekZ3yd1v33i6QuQU4hLvRME8suX8YnJGUWwNCVdb3tow4hiJPWsKUm4aDpJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780324068; c=relaxed/simple;
	bh=9MT//ZKbS3gf8ba9ralh8FSRPAk+r4LO2VRLdZ5zo1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y9F8Gwa70fghXS1TRnP1gsxFQC273senrmBvy+DE6kUerSR97u4jb9v0iviDWHAcS/gn9g/hHNPnKQPT8dvGZKzZkuzuiMZr2hjrRA4sZGr8YzLtCs2te2GQbIKitvp21Raq2m3vmxU61Du1p1UBtx5st+LKM9/arSESUpYyAAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eYSeQywf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MWJHKMzH; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eYSeQywf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MWJHKMzH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6519Y8hT3372731
	for <imx@lists.linux.dev>; Mon, 1 Jun 2026 14:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9MT//ZKbS3gf8ba9ralh8FSRPAk+r4LO2VRLdZ5zo1E=; b=eYSeQywf7FMxqrQk
	od7fVL+a15CjGgOjdKZ9JrJ6YgjM8H3b2KIHu1wZdwESi2mpqdqdk0gEILmxUiHd
	z7cILavNamfurl9wlRFX4dJL7LgBTviAm3kNOZa8ZsZNKq6RmiTRn466q+SngTqF
	MKkap1nUOcXGSGemv+DzXT+Bet7+QpfuoovnXJmrziUq3MPPtbOP587h5B7hJ09g
	w2R4AMcxbr/duIUgGGpmFUBxyAM+pcfI5jDVqBE584F72S/9lAbrV0FpLLF7+8Ix
	W6m3+2XO84Cydmp6MgZg4CdmVCBeXCk20G87YdSUah+HAZSPz3t5QClstxpP5fzO
	O/GUJQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh7jh96dn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 01 Jun 2026 14:27:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9156d10aebfso90061185a.1
        for <imx@lists.linux.dev>; Mon, 01 Jun 2026 07:27:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780324065; cv=none;
        d=google.com; s=arc-20240605;
        b=K3wL3OYQHcUb500zEsvw8ZV/SOKQnrmTIfm6AKn4/KpdoeKyAKbs4nmoB2qJt8vcuF
         xBlB65cVDr866RMJFLE95wgCpH3KM9k/m/9uZR2sMvkV0OYHbRU9eYhZ4oO+sV/6V9Dm
         ugeiaVEiSkzcHSJNYdBjmVAH99p1+HW73pqZkrl9/vFmU4BJx+RDifQrS+kEX1lje6bC
         aN9reSIfI25en7Uc6pnAE7mfLMPfnihOBdlCnh4xWtr/Y4nJRO1pbmkQfroxw58JAxVm
         /xYgPt2RPPXuaNC0b9YEVeh2PeE34xi0YvaILpYVb5rhDR39DgEaE4TNk/c2kYCK74k5
         sggA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9MT//ZKbS3gf8ba9ralh8FSRPAk+r4LO2VRLdZ5zo1E=;
        fh=D8fZWgEZFU0AF+quRh3DG0CUqQR/Rmi6gU4WBg8sgjA=;
        b=M4x7qgFGEePt/oqAzrtoELF1nFHt+0U2JZpSv/B4zqFpHK4ToHcalWppGMpMa59t+l
         I5L+9P/Cbkkt566dYBRVbF95s99fEDjTGRNRxcxULMFhqVVK6GfaHt1skkZwS7HsSvrW
         HSqe1m08AITjXevhb6i4ngdqWQ54RFomSRfR2cQ51R8kZQ0PCv1A9RFdHnQvTGpzmWCc
         tCIx2FKxY9cTjp/us1eqF3beB9v/oAmScCMuZLYMs298ZIvPpoBz0qHumjvn2PNwGm/8
         E2x1JzYsHiy5WjlPA8I/BZPnVGI03GldwA12okwvE2cG5qX6CPBQY2uOmORwIxCwk2q8
         557Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780324065; x=1780928865; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9MT//ZKbS3gf8ba9ralh8FSRPAk+r4LO2VRLdZ5zo1E=;
        b=MWJHKMzHq7yGSOH6iiQ4MVnjjWWHnC/rY/bpDwvW9K0Ff7PuWUQ/Fa60JRRXUJFoJe
         gSQJuYIFWMGNFH+1yTY49kSNUPyv7fEdW0IeRcHkci6AcjkXm+3LyIH0VkAP8ZgBLsGF
         Rkczbwt2i1G6QtuNZKNqA4ZQn2km38kkBTy8JllqG6Prmnr1AgVTQlM7/Zh4Nlw1Rsp8
         2nheYeeOjme/J/uUajyT89qWwxEjSAueFHLo1s/eQLGVzNiBXkRL65mJokgEYFOr5ihJ
         XcksEQ5usmk6+D1NFQSh9FomYiVpRUFLr8XAnfL9l3fddff2LjwDpkpJRE0DNAUMqb0l
         rLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780324065; x=1780928865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9MT//ZKbS3gf8ba9ralh8FSRPAk+r4LO2VRLdZ5zo1E=;
        b=kRi7hmnbyNjUr6MDTpnnqS5753bAKNABMnXn5W3FIspPzSCXCQQ+PC3zfsifXO5IyW
         8hcaonFT1bMQCVrcHqjTggSG4rr8WHVCNlikVYGNYoClCID9qHB14GTI2waSBA4nmCEf
         jo41Wthhb2uo7eB1LxhBcQSqRU82Bl3ybiAJ0JXQlS6C8sRAmn0Tig15ARaYesQIuP/f
         jz24B/jv6un+9wiwJTvx4b4HxpwLE5+QMuE7mK1nNrB19XQPbnFs1dcOAf2kOPDgSckH
         2ImNw4XTT51jlyZ256srixJfCqFvOW+Cjr5sI9DruUIYeunLfyCCkkTf7wNDuYCy/jAu
         nczw==
X-Forwarded-Encrypted: i=1; AFNElJ+//0dYaDGpRIBsjxC6g+SbGs6ADoo1/vKX+CNns9PIXZRkwuBq2KbfkTfy7oWdve9TZLE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwuWoR/4zgRxtsouFwHgFKnvw58hUw3q1N3Zlv1SlHx+saHYtU4
	vMFzXbk3YO1olooqcJOE7Nn5KL4Q1mmy0gPPJdG6CGD9NpqoO4iLzcpU3AjU4nD+kDXyNbiCq+j
	jaF6DDN+BwUYogOQWJgCXtnbeYB1vzyPgb9K+btmQ++SVTQ1jghCGfF9e/+COgercud/BumCo60
	CPxnKih+Cr4zAvGVJ8NSeDVSl2+cRIUg==
X-Gm-Gg: Acq92OHa2m+sfujS4i+Bmc6TPJHFKQQ1ju8pIiNsNCJEEjJCNwu/lrgl39XVsdL/QH+
	hlPV5uGUeN0M7Be7hoIyxjA+NVpRi0TL82e6ZIkxMwcqUjEaPdVZ/kwW4hQzopZ+NGKNKI1rf8r
	i0x9OVtVMm8mghuGqWJpsGCqVLn4dVMMBCWLUgRtgQvi39TPrTqzXzb8J3jMmsu2cbLerQXF5We
	YP6U30D+Ghtpx+lN40T+qL7VsDmPmbrND3xCBEhHtPvjg==
X-Received: by 2002:a05:620a:231a:20b0:914:e3dd:17e8 with SMTP id af79cd13be357-9153d938aa6mr1215099585a.8.1780324065152;
        Mon, 01 Jun 2026 07:27:45 -0700 (PDT)
X-Received: by 2002:a05:620a:231a:20b0:914:e3dd:17e8 with SMTP id
 af79cd13be357-9153d938aa6mr1215093485a.8.1780324064677; Mon, 01 Jun 2026
 07:27:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-4-645d2c8c75a7@qti.qualcomm.com>
 <178000689150.4557.11759359941436928903.b4-reply@b4> <df00e8d8-21ab-415f-815e-608eb7ab0967@oss.qualcomm.com>
 <23d2a824-e894-4c26-8bd1-02bbb8a7c6d1@linaro.org> <f7403443-3c0c-45d2-8235-46c70883a296@oss.qualcomm.com>
 <203e09db-ba37-4d75-b984-227298f55d80@linaro.org>
In-Reply-To: <203e09db-ba37-4d75-b984-227298f55d80@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 16:27:31 +0200
X-Gm-Features: AVHnY4LtL5VPWicujYWGAL868BWzmKvPSaREWLjiMCcMMmubijXxiTOJv64_r_I
Message-ID: <CAFEp6-3prh88NTK5U1HAARmQr203LVcbW4hoo_zuK4Qof4BAzg@mail.gmail.com>
Subject: Re: [PATCH 4/8] arm64: dts: qcom: shikra: Add CAMSS node
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>, bod@kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: QLsDRqEa7prC6KKAcCwUcrrdDIK42DUr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE0NCBTYWx0ZWRfXwXfvaCkeLQxh
 aLpbsygJjbqeJLRJ8jfsbX5MhyyRIQWSwlXHfBueFDm99B8r01JIYHrv25NMKEy+pW+7VTtMk9b
 TGJwRMAgSYddJcelfRiBlkEPbrji23spV974wg6byPoDznbNoedS2xuklbfDuDYbCcmT+YcvQ5n
 C1rZVV2hv7qAlZGlKfhYbayMtMQuvIKha65JAZItmCvrfyCM28ZlFEegZCxxiBjSHBRsxZ8ifAw
 Q8CG4fqu0DXLhYh3bOiuxNQPJMNqZ4UMygXNgacf34K+UFHjXgkC4W9Vm1F19z4yr0NtQV4K8Dg
 h1YvULVIJaeQcN1rWNGs5aKA3Foa+zIJbnGIxBA5BzNCb75BlWV44XpgN8k0KGYEAgRE12VuR/X
 icn9qlxCrQbRVyIIPB050nONEduS95hcVXFB5ZB5kjg8t682YtDFui2Df5tIMfzoURyW3EXPDgr
 todns2idef7WI9HDp1Q==
X-Authority-Analysis: v=2.4 cv=YuY/gYYX c=1 sm=1 tr=0 ts=6a1d96e2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=6RP30FUjIQ2jcUxmk7IA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: QLsDRqEa7prC6KKAcCwUcrrdDIK42DUr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010144

On Mon, Jun 1, 2026 at 4:15=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 01/06/2026 07:42, Nihal Kumar Gupta wrote:
> > Here is the full IOMMU SID list for both platforms:
> > Agatti (QCM2290):
> > - 0x0400 0x00 =E2=80=94 VFE non-protected
> > - 0x0800 0x00 =E2=80=94 CDM non-protected
> > - 0x0820 0x00 =E2=80=94 OPE read non-protected
> > - 0x0840 0x00 =E2=80=94 OPE write non-protected
> >
> > Shikra:
> > - 0x0400 0x00 =E2=80=94 VFE non-protected
> > - 0x0600 0x00 =E2=80=94 CDM non-protected
> > - 0x0620 0x00 =E2=80=94 OPE read non-protected
> > - 0x0640 0x00 =E2=80=94 OPE write non-protected
>
> What this tells me is that the Agatti binding is incorrect for addition
> of OPE as a separate device.
>
> > Only VFE SID (0x0400) is shared between the two platforms.
>
> Both platforms have the same IOMMU list, its just that you are
> correcting a bug in Agatti's defintion.

Yes, Agatti is declaring too much if we want to go the camss multi-node way=
.

>
> Again only IFE SIDs should be included in CAMSS...
>
> > The current Shikra submission enumerates only the VFE SID.
>
> Great, this is what we want.
>
> I think for future submissions we need to be commenting, naming,
> something each IOMMU entry as we have a problem now in Agatti and a
> legacy problem - already - in VIDC as a result of misallocated IOMMU
> entries.
> > Should CDM and OPE each get a separate YAML binding like [1], or
> > should both be part of the CAMSS YAML binding? If part of CAMSS,
> > please confirm and we will add their SIDs in the DTS in the next revisi=
on.
> > [1]https://lore.kernel.org/all/20260508-camss-isp-ope-v3-9-
> > bb1055274603@oss.qualcomm.com/
>
> Yes I think CDM should be a standalone block and BTW use standard DMA
> APIs with its own IOMMU entry.

Interesting, so CDM should be a dedicated subnode as well, and not
part of the OPE?
Then, If we want to use it from OPE at some point we would need some
'cdm' phandle in OPE node.

Regards,
Loic
