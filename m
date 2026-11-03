Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793683206;
	b=qaJIT1NJN+KpbRTFqURzwEkDEBYMvG5BJcSHbVLoGeEDlVlQ4woSn4Y6axm6Q3yhdBVY
	 xQ94hl2nrKsMx5ueupt8cok/Ot65o+j2eTLAx/zz38m85i87hpDo2r7x0pzXUXtxPlpXy
	 7X8fyT8dqyEU6xk0r0Zsl7qYSQ1SQAI00aBEWzp6WEpykNIOUkr5nqA2C1GIu1b6mQWPH
	 dAatd/cnkGX4ZTPK6DuLV4L1Hb/ZEvpWtfKh7iD4iz6HHqF05R1gvwWMKIqRaCV1imUTa
	 3M/81ggBf3HDAZ9p5lU6FwO4MoNcfxiqyGyelRFY6rgex7+crb2JeS0XXThIS8RtyzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793683206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pDTsD4t56MeX2uV9b6GeWSndHvaDFEKKyK2s+LL9ewc=;
	b=rdITM76Kc2kIW1OVyvM5WbhJwcn29VfaUR2JmfYvB0JpETCMsdMMoIHis25hTfMfQEVJ
	 l/JcjddoKapY9j/UVc3a1JKBLgm5SdP8Rz9UBbCbI9HtPt++jlg5YhGt+C754+hc6lM9T
	 q285w1KNlO5SEeUB4nEMSdxVh1GZKktwHOiIjN4zmQOrn9xIlksZZVaWjIKr139EAqcOS
	 OjZPOcuDEWuRfUeDq06JVP+rH61RAN9cCQ4zcJ++yh9HTbV///AifXfNq0qpy8LFqVFFN
	 gTc2yYqYLemGu/x+pIkWWCkNgvR8UJtl8CQ+scmzmcoxXrE+geYwNT8c58laWMdVeeg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="0wwD/rYT";
	arc=fail smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892A6606A329
	for <imx@lists.linux.dev>; Tue,  3 Nov 2026 05:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 892A6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0wwD/rYT
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c247f6687dcso647923566b.2
        for <imx@lists.linux.dev>; Mon, 02 Nov 2026 21:20:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793683205; cv=none;
        d=google.com; s=arc-20260327;
        b=M8HC67VpWU7vUIABmnERGB3Xmq9okTGGT/96624I5sYrlU9k2ZPsTOtpeZRcCe7r/v
         r9lgqih1hbtHZrAQmvfRIEoa8m7029kVt0oAI7lfHeM0sOYY0KrAMsvxG/I0oEVJZwhM
         x6krXDef+VsvW94ftex+mpG3V/vzJiSj9NVw5j1s4tCbjLHgLPKmtUByIt9HY00D04Tu
         xxhUTj73K4XYY0zjMbPyCAqh9KfQW/RhmL02EWkgH4rvb8s7QKO/Cx+tV4OufkjJopD2
         cQ2PFdoaA73FAorCNlsSEBrrDA1GcCYIgR6EmZ9AClIWwAeP7v2PlNxx3TecPpgVonHI
         Rcxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pDTsD4t56MeX2uV9b6GeWSndHvaDFEKKyK2s+LL9ewc=;
        fh=qGyajoI7oyA4ZM40mgiiW0en2+YBVCiBjVc9giMmEHU=;
        b=fG5sLmJUWMUJIzkDSuRfBRE3nZUI7jYqHGrnINaq6NT88LdmPNUCp6Lgb2l3UkiJ/P
         qMjwVD43dMEoGduZO49SGmiJ4lG/WCXh9SRMaKS2bLsQJ6VkQhY042nJSlW9yf1m3nb2
         aPcyPnYhYPN1rkUS4SgbAlSVdd1Ow3OT1dbJg5WZBTTsPMJ6A6KZX0qyu+c++cnLhJxW
         K5pTXlNVY4VN5yxFtK+KEvbx9A+NBZZCgCYgmof7PwNY1nTj4pHomc9GHr+spVbaz1Yu
         eTBexiMFrukNrQB5Fa2RwkBsZ1J06Q4rgB953TjfGxN1Ao4aKe2P1Gq92N5A4KS/Rf08
         lWjQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793683205; x=1794288005; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pDTsD4t56MeX2uV9b6GeWSndHvaDFEKKyK2s+LL9ewc=;
        b=0wwD/rYT4fEikdSulHffh2aEbBDzXl8xkZUWZVrIuiRiN6Mf9LwQ8CXjV2Aj/EvlN7
         nARXqyiPuAjgBwc2V61vUlJqX6wfmKiEBzw2ELHcp1kksNkFflnfDgkS1BOxxHtpH8AC
         REw0Dn/5STwY7acvnQA00oAhSTflTQHWhuwk6bxQM7DHv7b8x1Y46WPOONaMQX+iJ0CY
         phPb/MWZKzCPmFvYSOwX0CJhLlfmN9Z9HPFGtRQPZ/F/gYDQ1DBeiKHOk+oYyYKXlQjM
         4BLVXvehLHvu1OYqrKmP3cPxKkmBytsd1iyePNEE7uWmLHfm6o7tUwi9a545+8+uLk7F
         PRMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793683205; x=1794288005;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pDTsD4t56MeX2uV9b6GeWSndHvaDFEKKyK2s+LL9ewc=;
        b=q2Xzu7BdQ8DDIzIVEgJCJdiwIbxxAQxj5YsX3LARadLPAMtjeBEkWecuU1lrnWZ/mZ
         Q5Aibo9ZRKrY6R5rpAZpxVTyZGL4hr3CIv49xOQViTze8tOHeJHfU+BXQzQHhX8MGuXW
         1kc/7WwK1HwDBsJVTvdRXtESxc+xl7AQXwY2it3rD1js56J8OWO8ae7DHVAroS51TsB/
         RgDYBClh/UvGJpDfNOUuR8i3GUOcKaYOxVEOYAUgwTlC/+cZcj8h4PSBk7Ur5RN0wJaZ
         FVPaLIC61uetu0kxlgymOWUrsHVnVNgYk2u5t2NP0Kc+3LSRarF9z+xBSWzfaC1ujDoT
         +kEA==
X-Forwarded-Encrypted: i=1; AKwUvBweHRfk467fjYupYDnvCwARiEHneNqK0ZZRoBz8VgqrZjhi5S0BXOGpcdlQ5FCEzYcTXyI=@lists.linux.dev
X-Gm-Message-State: APuU4Z/HSP29H/Ekyn5uZVwijf/2jxoyUdODkSCQ5KGfj4WirtWguXDK
	6w8VQH36ZMp/EGqkpd1ySeGYzI63s34Zy2uUFWXM50G6x6faQACSt5TDjxosRMsCoVZGYOybe++
	5QyoOTET5ckBcKc/8EcypuO7RGrXOaRk=
X-Gm-Gg: AYBFou2eDgrs9JC4VupbB4/lQ0Zlv7S8/BpuoZq9na+maWdE8n9zS3u/OMe2ikgT7y2
	fnS2ncyZQInphSEgSiBDokT4ds/pP5CPS4zSEY1Q5P7+ozHjjreQLyxRLSLN8rqdTk5XpqInYKo
	kPkaW1bmll+7gVNEgem3mVz+fxdY4/HQ6tD+muZK6cwpVVI/irnqowpwWWF8C+3LlSmy2GNuigi
	fngiiJOIuYlcMoRIH7kVfhuctdu/odAN9XNIv4gRwre0Q4+Fzf0+6nrZP1NuFfYFn2JH9vwQ25a
	BxXyWLwJFuyg+QTA3RbqiHhyrCxjCdwyNS9boxglsaqPfzdI1Rs1xVyQ6uDTl9Reg2MiWExqcCp
	NvnWZhs52JpFU1N8aRkJ3ND8Oao+OgbjfExROiycBhhOtJLEhOSWQJ+jXuds=
X-Received: by 2002:a17:907:1b27:b0:c31:8441:35ff with SMTP id
 a640c23a62f3a-c4ca7ac00e2mr960824566b.48.1793683204767; Mon, 02 Nov 2026
 21:20:04 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261029073257.84594-1-shengjiu.wang@oss.nxp.com>
 <20261029073257.84594-2-shengjiu.wang@oss.nxp.com> <20261102-tough-brawny-rooster-a3d3cd@quoll>
In-Reply-To: <20261102-tough-brawny-rooster-a3d3cd@quoll>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 3 Nov 2026 13:19:37 +0800
X-Gm-Features: AclHuK9QcK19DBzWKX6U7B2jdmB2traqMfPAukSvaMhLFGEyPx_6lzhivdpXnb0
Message-ID: <CAA+D8AP+=qDya3JDPTn0WYTG6xvoc=ORqkTF5FNWvArgd3DB6A@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: dsp: fsl,dsp: document debug reset control
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shengjiu.wang@nxp.com, daniel.baluta@nxp.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	andersson@kernel.org, mathieu.poirier@linaro.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	p.zabel@pengutronix.de, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 7:06=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Thu, Oct 29, 2026 at 03:32:54PM +0800, shengjiu.wang@oss.nxp.com wrote=
:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > The HIFI4 DSP provides an additional debug reset control that can be
> > used by the debug interface.  This patch adds the `dbgreset` entry to
>
> Please do not use "This commit/patch/change", but imperative mood. See
> longer explanation here:
> https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submi=
tting-patches.rst#L94
>
> > the `reset-names` property and expands the `resets` array to allow up t=
o
> > three entries (runstall, softreset, dbgreset) by setting `maxItems: 3`.
>
> No need to repeat the diff. And if explaining more, say something
> useful.
>
Thanks for the comments,  I will update the commit message in the next vers=
ion.

Best regards
Shengjiu Wang
