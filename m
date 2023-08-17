Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E029154AD
	for <imx@lists.linux.dev>; Thu, 17 Aug 2023 16:56:12 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4fe48d0ab0fso12459689e87.1
        for <imx@lists.linux.dev>; Thu, 17 Aug 2023 09:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692291370; x=1692896170;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=45M2x5YAhqV9cY4arczfg6gy2q4n012sd/EVZZdA15A=;
        b=fiHhncNo19ca3MjlyK3XGOyofHSPIWPo4NzKCwm6qisU2CvZhNxKbja5qB37Lor6MP
         gKM+ZgE4j4xVzoCwcSudY1UlAhfR5s9GIqB0hwzSKuwAXWsC7ZU7f+zlMIOsSey/CESK
         4YI+vAhclLclQtkaL3UsFP22A0Vdllam30AY9XhzCsyWPpoSDTwfE7KNPZBmHS03LFC6
         hP/fvDwLhhEA3ecQVQtQ1MvAqzw5lPEBdY2t75znTET9O9zvwvDlqKhUqzEtcEDiLU/c
         iPEwEeA+GuINWHDQDtH05n4Hv+QWixZn4VG/dhrHT8cCNHaNIVO7b2uMa8oRQBqduymq
         lMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692291370; x=1692896170;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=45M2x5YAhqV9cY4arczfg6gy2q4n012sd/EVZZdA15A=;
        b=XJscedrO9RZYHBXzVDbR4LogbWPsbV1FtLcmDaI1efGrRa4EnEI9iCB9McgZN9L2QH
         jnK89WpwElDm8P9ttP5Q9fPrU01AJDw03ZxFvCmbTJG9CfTh6z+bnIrukXoAI3lCb1tX
         4kKnDQYpTs5oXiuEqKi2S99o9wkbHM6JppIqZzHbfg3S2Jt+HG1YVVrMDOTigAMbuMeU
         dP5A98zOGELq49k2MwDAZYeDdm1w+13v0WPbC2q4dmMmk6WBAlkguJAVCWgvji5r6zQ2
         wJ8worioXXHiTpBvz7ZJTrVl4lutLqYb8rXqxzZQR0GznK6/r0HEj7YtzcdsZbm/a6u7
         Icxw==
X-Gm-Message-State: AOJu0YyNv0ZhY30DBGQnNYnendknRJH1s+zEMR1FES/qe1niUZ0UfnQD
	VBOl7E/lEyebn0+TNb6c+anr1u53laW6ViNwGMw=
X-Google-Smtp-Source: AGHT+IEwy+g9JTQvGscvmkpeyhD+ig+OzZ1CDCUUdXg28Mbxc2d7g50QNpCdnMa5tyqIwqmR1dY2oKXPj0Q77vzS8OQ=
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6512:b17:b0:4fd:faa5:64ed with SMTP id
 w23-20020a0565120b1700b004fdfaa564edmr4699079lfu.11.1692291369783; Thu, 17
 Aug 2023 09:56:09 -0700 (PDT)
Received: from 170827741999 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Aug 2023 09:56:09 -0700
In-Reply-To: <CAC5d1WLEzaXEM50Yvp1GdEthMMC_jGEn5JUPdmeuB9Rd1VqM-g@mail.gmail.com>
References: <CAC5d1WLEzaXEM50Yvp1GdEthMMC_jGEn5JUPdmeuB9Rd1VqM-g@mail.gmail.com>
From: harrynicomama@gmail.com
Date: Thu, 17 Aug 2023 09:56:09 -0700
Message-ID: <CAC5d1WJvp_MkFXO61ivF_2r1TWj03TnjEx4EiJChd1r01yo=gA@mail.gmail.com>
Subject: RE: [EXT] Quick Reply Extension Testing
To: harrynicomama@gmail.com
Cc: extensiontest66@gmail.com, imx@lists.linux.dev, shenwei.wang@nxp.com
Content-Type: text/plain; charset="UTF-8"

populating local storage

==============================
Replied with love by Quick Reply Extension
https://github.com/HarryWangATX/quick-reply-extension
