Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAA1632
	for <imx@lists.linux.dev>; Wed, 29 May 2024 01:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716945808; cv=none; b=uVgUOEmH4J32K06elDDMxLNXz/5vOYBOpaqzZey//uWJj9koEBk81+cowX3zwUfjdQe9ue8JV6Dp/S1begURDchYmzzw/Fzs4CoJHIzglEyuWyMRFcPWQ7LubU9F0l4ssG3HzDourOP5428Q9MTQzp1OlyGwpMk982uU/R5IShg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716945808; c=relaxed/simple;
	bh=e5s3khJOdmJ7v931EAxx/75NV842JfvGlIRLpkw95z0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Ft5yNPQ0x0cFufVIgWKQWxqXnyrAf5gltCLCjddMv6g2LCxcBzvJQL/k+3vGp4dt7/cl3v3HYmeeogpVda+qjvK1MYhtbrHtAba1Ys8VUAEVjbH9tjdNvsZRnwnSC6T91+2BWqoSCrSjpfyvNsZ3L1ElCuHFXlu68Sctsguk8Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IYyWEoS3; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IYyWEoS3"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2bdf439c664so284333a91.3
        for <imx@lists.linux.dev>; Tue, 28 May 2024 18:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716945806; x=1717550606; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e5s3khJOdmJ7v931EAxx/75NV842JfvGlIRLpkw95z0=;
        b=IYyWEoS3e+Ezm5cYsM6P6nHZzQwSS7t+N8R5ZvOzeyLFzkA7nQqftdzwOmYWBLRBQ0
         gquP3CzrT133+NZAHoob+uPBLqR6t762LQSDpMpKJ1KzWdfLKHXWHJ9dNT0Ssnn1SNbI
         4C3GWwrUELrwYvLhaV8i/JbDjOSX8axdDv6NqSH0jM81gQs/OLbHaHsoGjBZfHIfliuo
         cIzBdcR1OiFKWXgu+5hTDh16Z8f4itOiDdiNvihaiNH23AuqxvJwsBR5n7Pm/A+GMtyw
         zKvlJHn1BxE+ZUKfcanAO3PJywlyadm/jx/wTUuBNc+GJ0sc2x7QKQkYgtqp9b21u1UW
         fdnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716945806; x=1717550606;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e5s3khJOdmJ7v931EAxx/75NV842JfvGlIRLpkw95z0=;
        b=dA5Voe6DbPXeyuzoEHZvxCe5nJHL8mATvSVjen5N6ggfZfU01mvM10HLxg3r/aDFGl
         5a0ktNJeIl2o2V0JoNog+mFW/CIgU06nQWQKnvOTw0dzP2uarOp/6AOzXRuTPiWnLstu
         WFMz/3xZ84LEYxjq2m/IRQKoxzzj3CytlrsR9ClbB9L4uqDkXgmSSVdnBT0yxwASXVmF
         CyYV//lBReo/YSp7oWZXAYv+p644sUNFarj2H1OfaKvNrCZ1c8aOYlhMlZF4iHfv+gXP
         etBpLWLy/XtD4WjuY2xdGAHr8WZovSTxla3cFKw8POL2Z3jCl9PJYBmlsLboNx/dWJmt
         NlLg==
X-Gm-Message-State: AOJu0YyzzgHzKts+mJMe0LErm2ndVtjfIDAzfuFRHAlzm44fVcOQZwzF
	VmpC7rOgdHZuL7DpWDnaQPMZVoWMAreP21YF/TZQHylCQzRsS6t1nZoHBiSPPg+YLyyuBgdIoxM
	xMaAKHuPDgqjk9gBrQFvW3XCpuEs=
X-Google-Smtp-Source: AGHT+IGIhuoDCvBwPyzTh2Ha+Wp34vHzOYxMWXVKZYI+kCsODVp0OK/27K/0f1fhcKGOR767U3YjsNjSiN+EQodHs3E=
X-Received: by 2002:a05:6a20:1056:b0:1af:d9a3:f3a3 with SMTP id
 adf61e73a8af0-1b212edb722mr12380037637.4.1716945806119; Tue, 28 May 2024
 18:23:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 28 May 2024 22:23:14 -0300
Message-ID: <CAOMZO5B0+jkaPo_6VKXVGb6SMAa78jLVQU3xUt92BpkAzc5AnQ@mail.gmail.com>
Subject: imx93-11x11-evk: SD card is not detected on 6.6
To: Bough Chen <haibo.chen@nxp.com>
Cc: "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi Haibo,

On an imx93-11x11-evk board, the SD card works well with kernel 6.9.2.

With kernel 6.6 the SD card is not detected at all.

Which commits should be backported to 6.6 to get the SD card working?

Thanks,

Fabio Estevam
