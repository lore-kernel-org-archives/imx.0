Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8942D267B07
	for <imx@lists.linux.dev>; Mon, 28 Jul 2025 14:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753712047; cv=none; b=b8Z3LUXez9S5Y5K67pPTlCus1qEo87fwY8XAnpgsriZfpvnF920hedkGWMRT0hsp+2Hg2Zmb00Q6yxF6owMuxH9MEBmKB9mqj7wH1adiOLbDcQO+teQI+AtpUwoYn3i4ikSZyD4htJDpPsbrRpNiq891iMJWe07/6oHfQVWz9Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753712047; c=relaxed/simple;
	bh=g45KzbwgBA7e0spemcISRrjUGP7tGUQ7fGO81mfXqk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uNXR9rz0a4v/q4oRY3iNGUwS7iXgNJk5GzVwy2ewg2Khc+R7sGfM+t6h4IHjPLztYYtnTTPORsKt1ODLZP5FDT+lSwuOy597MxEElu7oMIu1R3Vha6mFBaME3Gu988MpMCyv2i99FdO34XBAuRRshfVnx8aaWv8n8Lfqpf9M0Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FsZxVTVW; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FsZxVTVW"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7494999de5cso3047048b3a.3
        for <imx@lists.linux.dev>; Mon, 28 Jul 2025 07:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753712045; x=1754316845; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VkRksZeZRdJUhfD+fysrVUZxN07ubnU6SAGQQ5LsnD4=;
        b=FsZxVTVWSjstiZQQqxg3J0Ol4uYEzYeE+P14eT5ucz4I5NlVlEX75k+JLLU9PFJkFk
         CPc4q2tJ+U5T1zN9Mk+0iVhH5RdPplx7vhWj+xHbhOsBxV4MAXgg3z35powPQsjmMxIS
         QZGdRIt9XXXd+Tkv5AxA2lfP296eN6CQKBaZKwekAxF9+UAdilq97jo4xB/rgX4mXAAI
         Hw37J00gLTDm3Q2w8wJUs+dOgvYpTkLyuoWcyebVTFIN9ZJ3BUAdjM5rUnGWZpMLQXXa
         H2dNuI9HJvX9BxlEp2yqaNxCdt3vGoJqVVYmRa7zECKZOTvENzfZX9TDliGRx+NmgDzg
         0DUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753712045; x=1754316845;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VkRksZeZRdJUhfD+fysrVUZxN07ubnU6SAGQQ5LsnD4=;
        b=bo60BcAp+PdRjzoFkNG4VxN9gy8WTsUXXgLRUfo2kdOXADhPZK3Msvj0YHWRevChiN
         D/S1IdURPLMhBLQEtTszZZsV/z0Hyezg5vS/c0WkMEx0+tLw8MFSfVgMAuZguUw9zmZh
         iFMeKd2FSSO4aKtIC09L42OsX9hXm9Bpjw4RROipIhF0VlTFjdcDBg14ncr5al6aTH7W
         FsqaSPBcDVchrwGjOmEyzXtu77Vu9Pt5P54RdugeeTVEC5dBdGlMDzdNpV9JoZ4aR6ct
         kGUNApb3a4T65Qr3M7U+xlTRt1tMbFzLb5JvifbW23SzgOkdf2/gpnCTAme0G3Nyvc4p
         EAvA==
X-Forwarded-Encrypted: i=1; AJvYcCU9i1Sz3OKhUcywSIPhDhSL3on8SpT8EqxzPOlCC9Rwm4Cv4bi64mbwsR/Q/VEPpQMZ/sw=@lists.linux.dev
X-Gm-Message-State: AOJu0YztKSklCNEXAnOccujcX/tWt7rsjT21dV+f7kybNA+84rdPl3sf
	jLmqIQYTVbbPI8qwc4DmUml6zjPnkVKLvpLIknvAaVyWGulh6qWBq56aRn34a8n9tfg=
X-Gm-Gg: ASbGncuzd8+wT1lwiLIEL4wbHpD/+dvHTO08xVkjVQ9lXdcSdGRSSkHG8pQclRvsE8i
	aivLeJn76NQUFDxgO9+vL5KzkrMWKEbj3Q8O+ISjIHMmEJ5i4qKXjRyd0kSunvr9Ybscs+cIRYt
	ODQ6P5AofBjtN0kUIh0bJewBnUAFKufyNtAVcTE0XCCNsFLi/uDlwmpI4H1c4WqzVaI6TqOScPr
	pqHiZD+Ep3TXxnKWs65k4Jxxc3ivIA+qZlWS2tyHUDzuc9EP4wfBhg5Gsq/QO9ij28RiinHnjPN
	CIV1LENhK2MI8gQojbm1bf8rSwoo8JgUiv30LVTZ/iYa3j4MeVV0blid/bSZKDMtAIVdzuIxkf9
	QC80WPP+9VyYEPm0xmU0xtzEAysMb4ybsPzxq
X-Google-Smtp-Source: AGHT+IEzYHk+WznmPpX9Fulm4uS2KRvmZT0lrK8OW5a60R5q4nnqwgfy/r5C+L542XQYKAZbclCwBg==
X-Received: by 2002:a05:6a21:3d95:b0:23d:ac50:3342 with SMTP id adf61e73a8af0-23dac5033femr345980637.38.1753712044666;
        Mon, 28 Jul 2025 07:14:04 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:82ce:5506:d365:5bcb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76419d84234sm5604059b3a.57.2025.07.28.07.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 07:14:03 -0700 (PDT)
Date: Mon, 28 Jul 2025 08:14:01 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andersson@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] remoteproc: imx_dsp_rproc: Add support of recovery
 and coredump process
Message-ID: <aIeFqVUp2C6fh4PT@p14s>
References: <20250722075225.544319-1-shengjiu.wang@nxp.com>
 <CAEnQRZBc2X6Yn0X+RbJ9-OSxovnHvoqJ3NXsJKBkuH82GNSAHA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEnQRZBc2X6Yn0X+RbJ9-OSxovnHvoqJ3NXsJKBkuH82GNSAHA@mail.gmail.com>

On Mon, Jul 28, 2025 at 01:39:38PM +0300, Daniel Baluta wrote:
> On Tue, Jul 22, 2025 at 11:16 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
> >
> > When enabled FW recovery, but is broken because software reset is missed
> > in this recovery flow. So move software reset from
> > imx_dsp_runtime_resume() to .load() and clear memory before loading
> > firmware to make recovery work.
> >
> > Add call rproc_coredump_set_elf_info() to initialize the elf info for
> > coredump, otherwise coredump will report error "ELF class is not set".
> >
> > Fixes: ec0e5549f358 ("remoteproc: imx_dsp_rproc: Add remoteproc driver for DSP on i.MX")
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> Changes looks good to me:
> 
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> 
> I've tested it with Zephyr synchronization samples inducing a crash
> via debugfs interface. App
> can recover correctly.

Very good - I will merge this around 6.17-rc2 when I get back from vacation.

Mathieu
