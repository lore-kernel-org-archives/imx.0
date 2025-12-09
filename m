Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22162DF133
	for <imx@lists.linux.dev>; Tue,  9 Dec 2025 14:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765289333; cv=none; b=rMulWrLAJMJKswE70ui02soJXI95hVeC7jzbnCq0F8bUqLP0Qb27M1ROytGuAhCUM9xdfjUbZNDle2ARW5MeSHG+TyJQsFFcUuQnw4KjQg4BrDGPygcBn6rizLQ5LEaA5H1a0atQiORFS9eCE0OSq9rVMC4mJ0RAGWmt2fCJNGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765289333; c=relaxed/simple;
	bh=VyyBZwlKUZ2rmYSXMRbs5oz8IUqh5cHk9HMqteoGQSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GStD95+E73nwZbr9jzWavYn8sPUs3SK0D/ZP0s4Z20rb2tCniaoWNSonNE/m9Hio3jLjkVLAv0DuhQ1W0Cc4d9zb1yzLDXWJtPfz8sxvjYg/M9A8Rd8IctbTGFPcn2KpSWPBbwbFnANekizXvT82mTomxbDJFGryhujLFd/EABg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OFYjNgFC; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OFYjNgFC"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so4708350b3a.0
        for <imx@lists.linux.dev>; Tue, 09 Dec 2025 06:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765289331; x=1765894131; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VyyBZwlKUZ2rmYSXMRbs5oz8IUqh5cHk9HMqteoGQSQ=;
        b=OFYjNgFCc9MZcf6ejP+amnjKFrLkFRf4qtyzTtLZGnd9KRcyb/cYXOT3WgLnEhb7gu
         n36NV1/3oQb/Rex2Oq6IZwp9wC2fFo2bmNGyI5dTwB7PHIdzj8JBaqNcgYUaooGNTDgN
         YhUuPlIpKNvpkCn7AQrwezH4Ygi2hyfmbp3koMysA3vt5OYhnmpri1w/BdW+dp3GTpgC
         Zc4afG+B0NZuSttN12mdMy2ygthBBthL5rfsIz/4DmnROEmGiXrtZ8qEI2wl5rEiUTct
         0opT4OQZW47bwoR6URdT6raSitWJHN0l2xzyVRg+h7AcHMtgwJLVEAkxqnHq6OXLztVk
         SxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765289331; x=1765894131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VyyBZwlKUZ2rmYSXMRbs5oz8IUqh5cHk9HMqteoGQSQ=;
        b=a/UfMUbjU3+SUg5Z7xMKhyQmq4wpqaMifE7RkGq1a3kZSdNy5V6WFDyF7zkvqT04xv
         bowUZ+NfNb2186lsdNUcBASPrbNEmXncO0aoXTjsardT1ZadvhtHkgss1mceESCw8fl2
         5kermSjuj4CpDukvczszwpVFItEs2QiG3WYJl5RSjPnzqRhJopGlYhvSYXIXe737osLh
         MO9sBQ4NbNwk8NdCMEf688Qi2JM4ATWu4spu82kIRvblCvlP0xAqNnNv+YbstaSUF7Ra
         33RucJ14JOSLhXNxmmSulGEsXBcEwlqO9oJYMOQOU8Mo5PZAvN3jA5smu0uxGYDVtarC
         OreA==
X-Forwarded-Encrypted: i=1; AJvYcCV3q9Ynf0RM5BGPny5DiB7o0EvdhrrvWRhkffjudN9jtUwLc3EH+mmydPXNWIDfkqzcW9A=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQt/RERW/8fOiE8XZIZncprp5Bi1y1518yBu3ewitZSAzABTYN
	CD5yJvlTC2U+6bzDHCpxkpC0adFs2Df8nvmkYxWKSejckTuBjV5uZkqt6I84L6uvtMZwDljTEL3
	zg+pcfsJ0SDAh/6Ovv/ATYhR6j36wU+0=
X-Gm-Gg: ASbGncupxuttshvss3BZ8SvIBRTmMwrK9xHtyz2w2lu/V8+VfElOXL8L2Bt2HZLtbz8
	/zrB9zANh+u/jPo2RJV8guOaI+EKrQMzUO/t2QVErR7E6eDYU/hKLrOrlprHkYZkPqOV67CChA9
	qfDN7waX5WRxbzX1nVr85QGvuKo/4o+WGSBn0bFGl2Cit37/xwXiM9WXCLxVLjrXt9DDmAPbMVB
	85STNjWeBEKm2hChIhRyXMPxZgVBhowZSYg3w8PgyJABcl8MDndFqCH9iGgXPrFQThIy5hB8Hf5
	3ZuCZw9OwqYCLNYEj3nBIhCHVSUloUOxlLPYNKnuVui05pYOP2iOaWlXgF8Ogm8C2KKfCAW2JEu
	MM+VF2IRZ1Q==
X-Google-Smtp-Source: AGHT+IGlAhSuqCl2kRyMGsShmSil97vNdY0PHNYfllyi4vyK36zscoZ6DMWDYGU3rPKH1rKNgSPRieolC8FcfVHxjzk=
X-Received: by 2002:a05:7022:423:b0:11b:8b4b:bff7 with SMTP id
 a92af1059eb24-11e032ac942mr8661512c88.39.1765289330793; Tue, 09 Dec 2025
 06:08:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251204122825.756106-1-iuliana.prodan@oss.nxp.com> <20251204122825.756106-3-iuliana.prodan@oss.nxp.com>
In-Reply-To: <20251204122825.756106-3-iuliana.prodan@oss.nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 9 Dec 2025 16:11:19 +0200
X-Gm-Features: AQt7F2rz9EfsJBbiHeX3xN1JnTkS5oOdOlbJa4JQf39jSVqAGLuMb5NMx16wl5A
Message-ID: <CAEnQRZDw-jwpXdb3oi+-DZ+YD4aQfyON0gPNrGpox1v7m4Voig@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] remoteproc: imx_dsp_rproc: Wait for suspend ACK
 only if WAIT_FW_CONFIRMATION is set
To: "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	"S.J. Wang" <shengjiu.wang@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, imx@lists.linux.dev, 
	linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 4, 2025 at 2:29=E2=80=AFPM Iuliana Prodan (OSS)
<iuliana.prodan@oss.nxp.com> wrote:
>
> From: Iuliana Prodan <iuliana.prodan@nxp.com>
>
> The DSP suspend path currently waits unconditionally for a suspend ack
> from the firmware. This breaks firmwares that do not implement the
> mailbox-based CONFIRMATION handshake, as the DSP never responds and
> system suspend fails with -EBUSY.
>
> The driver already uses the WAIT_FW_CONFIRMATION flag to indicate that
> the firmware supports the CONFIRMATION handshake at boot. Apply the same
> logic during suspend: only send the suspend message and wait for the
> suspend ack when the firmware is expected to support it.
>
> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
