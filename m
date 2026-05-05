Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72921DDC3F
	for <imx@lists.linux.dev>; Tue,  5 May 2026 14:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777990810; cv=pass; b=N/yyLeQyZXrmiaZYeiqbJ5AW+DcayLPz6aDImC68lq4/JWWnuNaCvVrPBrsWdFPmqntaK7rqF6Xovivb6ChlmseaJO2qoqURpdw9qw6gpkFLdf2cEs6McWcm8rFc9XrlkZpOhviS78lafPRPl1mY7AFzJ5prSau5N86DXYZ3T+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777990810; c=relaxed/simple;
	bh=ChyoarYNml6Xd8oWHPc66ogwgww3Zb1C5cukHDM5eVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gEyZSV15rrT1lJLzmg1GYzav1ty0mKblnpbgoecg+E2KA+uaG1GKdPBh0g3J5w55Ed5bet8ctI2gQTAw63YDREMqgvCsTc7UGSexAcrYNrfj+RNe6+sJGzGG53lJ1CLSfZtcK7fQCi3MRgIMhSZrJ7YDoGUurlBMR7E+xj/YCSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=T1tiHEyZ; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="T1tiHEyZ"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a742b8b72eso5611336e87.1
        for <imx@lists.linux.dev>; Tue, 05 May 2026 07:20:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777990807; cv=none;
        d=google.com; s=arc-20240605;
        b=CwPQM35GbL0aB3BmVR3ffWty4/Z/uCRmkh5VmCNWjOObTUvMtoIS6cYAJH1W2a3u9F
         0Gb7U/GwepaXKL6pubRni9TERi0dcugFgbJbeOcmlnaTCRGRFyeB8oH0BPD7HxAyb+jh
         7/xo5BtcMdkVxmpXKELMTe+3ozBU6KSnS4sqgftkRInkrYzXYLGdOxGlKUYMmyO92Fho
         kmgpJ0VOchxp7Acvw0B4DAMmMkM1gDeTbAewdqRHwsQtBUzimSBkMl/rFe1tmglpIuB3
         Z8tU2rJDTbB15SH878SvMs0hcAlTOHB2XpTrNh0ERv8M7g3MJPRZjWc0bgiC2lkdqBx3
         dG5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vh8m0B9MgA5fRoS19D8lLgMin3oijQepyIo3JhQlmkA=;
        fh=0t68MPEbWpxeThiWcS5umYFVtyJBMiwtRCdxgOS3WlI=;
        b=i6AODlpa3HON6ecryfdmN/Iannd7OzJCX2NWF5dcVlat3Yim+qTxYjQdIkqCwFamQx
         U9qqi9os7m4H5lnyakIU7GACBN6evdME1XnmmnYTLGLtBqPuPlkbqdpmpzRYkxC6RQvS
         5rdkxOkNgrocTovkGrYdnCBvrb1BAxJQYg47Eqep/JkxzfakBNkOF+h/b2j4HW7Pm4Tc
         lYAY1n3LSDWbJSkqicwah4oRdjGW1QsYbZujSsSOsD8jaw8/sH/drlVZ62SM38++G+Vz
         ja5GHi+PdH4SkgypHAfLvai6YaIdxdIGGQn9QxZ8WMjnKESHstbsFMXjpKvu3IKOKcoc
         ofww==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1777990807; x=1778595607; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vh8m0B9MgA5fRoS19D8lLgMin3oijQepyIo3JhQlmkA=;
        b=T1tiHEyZLFcoXBzmmv6WXKxh3Ntx8Blvevb9oHbOY89ododujpNhqcwIHJhGUU4ZUv
         N4FXjzb6l95V1kcwHepjonOazHYwBPzh9NhkxyVgqJ7MsLzDDFgtwH5+XZaS1GpcbT76
         hdw72xf/5qCx9F3Xa6kTF8oN4Q0/CIEffibio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777990807; x=1778595607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vh8m0B9MgA5fRoS19D8lLgMin3oijQepyIo3JhQlmkA=;
        b=MiQvdhPGZxFYLHj5nsqkM7imbg9YIQ04rgmhgiPM3bz2PZMNOTSRf7qtxc5IoOY34U
         L6CRvh3TR/kgctewtkodpTPFUdnW49k9YYm6ayiopT0JTQEaOwzcK6/IABLD3r2nuR2z
         R11mZax/gpEMtF3aSD46zcSujGXm4xqAgjcuMvQKPJzNk5MxXYa0kXJl48OVuClmGvLJ
         d5OEwhUpBpR7QhjL/cmsdFw1Meu8Ugm7N1djT2FWHok4AjxvwMBEVlBOGKSICFl2IGGx
         FwyvQxTMQ+pHHpU/wB36ArOqqo72VCIAaiFSvT48UY3DfoGCZCJEc8o2OtvZhg0Ud+HP
         dzxg==
X-Forwarded-Encrypted: i=1; AFNElJ89Yx9uhL/WxwAP/LObcivKg955hp9g+AyuJByHD8OxAUENafv1xNg7Ief9ePUa4gUYmtk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwqJn0f2Fo2KcDZixciWroUE5k22eJGgqOX3UcDCOaWr7kMHa68
	FQtYutCjYXlp7MqiVvRzf55nrqfJmF45NwyL8AXMoYafj/t6ol/uMfeyS/EkBEU1gSze07Ovs2c
	/Fs+RPADLk0XagZQMVK+mPYrJ+ceNr4UHspCcx37k+Q==
X-Gm-Gg: AeBDietGwKAqs7c/jhweYDQGieCArSL5ZWyeAMmjuGKUPX1x8aNEFTLb0r1yoWvkN/K
	N16wtrDdi3gbprY5fQx2YkrmXf/tohYtc38ttqE+Mo+uncQtlC2BJjBd9vhq5UjKTwdBaqKiYEi
	a7f+nyzTz5ebj+Enuc18Fo4gtq4VJzoljlyUXPey/Wp4P3lmhWuxvw9I0bUgPIlQm6ylpItGQaS
	H7h/y/74gRAJshn93y5OKNksrFOalrzJj05Xo0YzQceH4pcGwHzO1jMadubpExBugFFKkS1EeVI
	b+4qZ40k5aQJ6kweDiN/hO+WKwqvKA==
X-Received: by 2002:a05:6512:2301:b0:5a8:750c:2f79 with SMTP id
 2adb3069b0e04-5a8750c311amr3197990e87.3.1777990806894; Tue, 05 May 2026
 07:20:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260430132140.30369-1-r.mereu.kernel@arduino.cc>
 <20260430132140.30369-4-r.mereu.kernel@arduino.cc> <6e46514e-91de-4d1c-8eb0-d1688e0a3821@oss.qualcomm.com>
In-Reply-To: <6e46514e-91de-4d1c-8eb0-d1688e0a3821@oss.qualcomm.com>
From: Riccardo Mereu Linux Kernel <r.mereu.kernel@arduino.cc>
Date: Tue, 5 May 2026 16:19:55 +0200
X-Gm-Features: AVHnY4Ly1akqLwjBLxTf-Z_CJJjy9OcQWTWkDUXFiYZUdxwPPlqgokETeSK1n84
Message-ID: <CAKA1JhZzsB0HH_szK74ii+wVkAzNG=a8B6ceT9mrwbxV1d9=ww@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: imola: add support for media
 carrier board
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, broonie@kernel.org, 
	linux@roeck-us.net, Jonathan.Cameron@huawei.com, wenswang@yeah.net, 
	naresh.solanki@9elements.com, michal.simek@amd.com, nuno.sa@analog.com, 
	chou.cosmo@gmail.com, grantpeltier93@gmail.com, eajames@linux.ibm.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, festevam@gmail.com, imx@lists.linux.dev, 
	m.facchin@arduino.cc, dmitry.baryshkov@oss.qualcomm.com, 
	loic.poulain@oss.qualcomm.com, Riccardo Mereu <r.mereu@arduino.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2026 at 4:11=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/30/26 3:21 PM, Riccardo Mereu wrote:
> > From: Riccardo Mereu <r.mereu@arduino.cc>
> >
> > Media Carrier is an expansion board for Arduino UNO Q.
> > It adds two CSI connector, one DSI connector, 3 jack connectors for
> > headphones, earphone and lineout and 4 RGB LEDs.
> >
> > Current devicetree overlays support:
> >  - imx219 based cameras (both with 4 lanes and 2 lanes)
> >  - Waveshare 5" and 8" touch A DSI displays.
> >
> > As can be noticed DTBOs are split and no overlay is performed in the
> > Makefile. Overlaying is handled in user-space guiding users to configur=
e
> > the system matching what it is connected to the Media Carrier.
> >
> > Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile             |   8 ++
> >  ...rrier-media-camera-imx219-csi0-2lanes.dtso |  49 +++++++
> >  ...rrier-media-camera-imx219-csi0-4lanes.dtso |  49 +++++++
> >  ...rrier-media-camera-imx219-csi1-2lanes.dtso |  49 +++++++
> >  ...rrier-media-camera-imx219-csi1-4lanes.dtso |  49 +++++++
>
> Are the 2ln DTs actually useful in practice?

Yes, all the cases are covered for the supported camera since
inexperienced users are guided in the configuration of cameras
without the need to perform overlays or write their own DTSO.
This is done via a GUI soon to be released.
That's why I covered all the possible cases for camera connection.

> >  ...10-arduino-imola-carrier-media-common.dtsi |  46 ++++++
> >  ...a-carrier-media-panel-5in_touch_a-dsi.dtso |  80 +++++++++++
> >  ...a-carrier-media-panel-8in_touch_a-dsi.dtso |  80 +++++++++++
>
> The waveshare,dsi-touch-gpio compatible is absent upstream and I
> would imagine it'll take a considerable amount of time for that to
> change, let's focus on the other bits for now

Ok, I was hoping that mentioning dependencies in the cover letter
would suffice. I'll drop panels DTSOs in V2.

Best regards,
Riccardo
