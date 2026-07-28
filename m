Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E844734D3
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 19:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785268549; cv=pass; b=isWemI9YsWLMgPJKoIFpDoaB4DUu+5/pHzomqXxwU5x4NQQdrUgT9+1kHnHn0cKwqsJFZzSyfamyY6EmfvPXN6rYXO3+KyBzKcMtJh/AhTLk82H+uyXI77EHnPWad0AgJgWirn26lXEZ3PBC3WiUIxhClIhjFm417aLZFAkkS8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785268549; c=relaxed/simple;
	bh=k/vaqi2FyTkEbHwSMIRtJQxrkVlf5Id6agyIhyE0mMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g5hDxMCfjhSL31DFhtfugYiQOoekNdAcbWu1knSxR67TSEdYZGigP5IIiUoxlLPJX+nRwmNXKPSAA48eBn8u9YyEQViRybt9Xoq1xJtb7KeTWcgyLMoGBEnDkKyDu0SCqPQjulxt0K1CfLFlAap4dDbO7YSU3r+VtiRXGAdPs7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rg/z9Rn7; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rg/z9Rn7"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aeb8c19017so211628e87.0
        for <imx@lists.linux.dev>; Tue, 28 Jul 2026 12:55:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785268545; cv=none;
        d=google.com; s=arc-20260327;
        b=ISG/FLR0m6ukaL+lN3QoW66oYhWMICsfDEerpMFPEcp+317gDO90jIcYWS5flfqB2k
         Wrtr8I/hFqxhCBBt8fMiGRN/cokQvCDMag4wy7LF9g+ksG5c515C5xn+SbcCplgyC5iv
         BO7g1OvGJLlfOkRBA0PdGqxaMxpyp3iYvQGmeoj1hdbrGP46+Y64W1XHo9US/F146Pyr
         MLc44AD/kM6CIijzc7lVwpFM/O2j4+LK9wte3b0qfU8DHeNWeYqiVWk8J9WN+BAcOmYA
         ozqV3nhpZ0i2FU6vU/Hecnb5NgR8WoZdDwFC2t7ASB6H7ckVJe7KY+i62G/J5GZlVau6
         ui+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k/vaqi2FyTkEbHwSMIRtJQxrkVlf5Id6agyIhyE0mMI=;
        fh=w36tnJi0sP8Iil01iLyDhoHf1sX4gKl+pxZNz0nBi5E=;
        b=JkUQFFX3ZuiTZ6xPZFrdchu/9hPRSE+fqhZjrETFObx8Tls/XlBq2SJON5aEny6tk2
         wRqv520go+Kv3p8r4q6LeES/pJvh9QSDwskx/KAx+HzvNFYBFN7Necf52ivBdlQViBnX
         xLto5XduBUg9wc/9iZMjMvzx1WfLmIYwPQ+jBHcnueWoE2az8zkHlw2VOsYt/cqmhZJI
         2GJ/96e9qTZWqerc/WJaBZtRMZximLyuMctLKqzmY5NmzJ93A86J6qTjamB+5MbRl6fy
         f+7fgNIazt9rkyyYx9Gdj9ai1hkYJokTkMHaBBHMReu3Flv1oYUIg+rSe69Nv1d1j3FR
         gyYg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785268545; x=1785873345; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k/vaqi2FyTkEbHwSMIRtJQxrkVlf5Id6agyIhyE0mMI=;
        b=Rg/z9Rn7Tbe+nZnB0xnNvbGvmamyvW/vOQO6XxFYwkaPMF6ZEd+ocx05ut0ArXz9Qg
         A+A59NlmtOFJtKmrOLQbJiqOHALbj+Ap3ww7WVOuMyqcL25WWcRQo6rcU9dBPqjlewxj
         gbaWrEN2FpaMjFwvVJm9kmulf8/OcBR7p73fBgzGeXNoFIVZHdPA9UfRhKZ1Q1iib68x
         Ac5VSi/GrSCVPsc1qBtj6bcHxkBO6NT00nHJMOhy5Na6/KoRILauyBzTO1rkuTIBQ4kQ
         trIyJP+vgEJkqN5fJs9UI6Eg0GbnUsfG6V+9tYRgiLQ4XBTikoFNOU3/OYU+mW0jV27V
         Zx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785268545; x=1785873345;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k/vaqi2FyTkEbHwSMIRtJQxrkVlf5Id6agyIhyE0mMI=;
        b=JlfI+jK57dvUjbL38vLIc/3na5QsFVs8vQIk66T1LiLhZyadgXak9APd5U/kmm/nlJ
         +HChWN1dPMnsGKPSeEK7pMNZNzNW+M9MuuksznZUj5YxdU2LZrKRPzApHR4dBbIRlqSm
         rqoo1xg5Wy7sMTGtZOjaO2+MdBFuw+EByCbX/1c+GnREZIROheblKPc65HLpssOqMwqn
         SIqs52yEgTOv2Ic2nKMF8DdApqmKVJYGA7393VP9HaBRiXDZeFRUN1AWrQ0IrNEV7UWN
         z+/ss/s5TOjJ1CdUB95VZO5I72nmTI/dkuMhIFWqUHrlmh/a7dYRoV7HLxrwkKIz7A0i
         iJJA==
X-Forwarded-Encrypted: i=1; AHgh+RrFtgC2y1llwNx9qmDbxB1s5ksx9ulYtm97mIpFMhsXBMtIba8G6RZ8wjv5MnEtkiyVymI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxU+wQ48/plwFcFbTJxPlVe+9tf/Kr+HQGU8gyNc/r2eX0gmSaX
	9sUXcy2uNfl3PAxyFTjtq4fEJmNCZtfLwyzwspHVjsWzuEiBIqf8PWKlGs47jNs3hUZFR8S8cbc
	xfxey4lPZ8k9BrwZqumvisuESMjt51rk=
X-Gm-Gg: AR+sD12Dp3eXGvWbVqmKlRIp47K7m7hZrnwzXKKJhhDg7iEEwwadPhhMPs1+9L+icfb
	1nqnF+eUo48V68GD/SeiPP/yaMQRNfykBui7kSIM+JRmtOnQWjZgxPuweLz5bcf723Q2F13yyTs
	mwJtmRDoh4phmQfdXXxqD2dnqx3B5kLX7L7cY+ZE+6U1VCd1WMyyX14nX2xbbqPtKtLk0y0DimK
	5itMHdThdAmZe7/AQd+/s8usyKD7vQE811/iv2hv4hQaGEGOHrDZCrlI+LyDU8JhKDYeb85L/oU
	Ru1SvpWuw2WuQVcAbkKsQE5JRxs5MRJOQ6KR1hQjuYhPVGzvc4tw9y12TGeI2lrLZ0+wI1M+n0G
	LURGejAo3AwPOdvaY6CQhKHDPbVI14Ea1IA==
X-Received: by 2002:a05:6512:6ca:b0:5aa:6e86:55e5 with SMTP id
 2adb3069b0e04-5b2d021347emr809678e87.13.1785268544805; Tue, 28 Jul 2026
 12:55:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260724201322.73937-1-festevam@gmail.com> <4f1a89b9-41bc-4837-a057-f0e67f745e37@sirena.org.uk>
In-Reply-To: <4f1a89b9-41bc-4837-a057-f0e67f745e37@sirena.org.uk>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 28 Jul 2026 16:55:32 -0300
X-Gm-Features: AUfX_mw50no9mOYimhnk3XmqzC9Nds6MgBtadeBlEak5FStl0-QQmdqYKeQ1Hes
Message-ID: <CAOMZO5BfCSkM0Q7oNW3oBNRfXY-C4dRxCcsrs-y+TzBPf28OKA@mail.gmail.com>
Subject: Re: [PATCH] regulator: pca9450: Support regulator-off-in-suspend
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	Fabio Estevam <festevam@nabladev.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Tue, Jul 28, 2026 at 3:18=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:

> This is the same register that is used to control runtime enable, I
> can't see how the runtime and suspend enable operations avoid corrupting
> each other's state?

Yes, I'll rework, run some tests, and send a v2.

Thanks
