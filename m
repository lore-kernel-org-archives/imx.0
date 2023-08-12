Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B3C15B6
	for <imx@lists.linux.dev>; Sat, 12 Aug 2023 04:18:48 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-523b066d7ceso2781660a12.2
        for <imx@lists.linux.dev>; Fri, 11 Aug 2023 21:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691813927; x=1692418727;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vatK4Ipf//SB8sITykjtNfrRvHRtapdBa/MAooU+rFs=;
        b=MYX00yLWez/8y81H3p8OH0MOOAcoLaGsxFX5T5TOLu/pPCKkyR8ocI484iYE1bY8FA
         I3ML/XR2+y/LG8m2pUeHTS09SQiWG1eyNby8JIbjeUB/VXXp2lGNmKChhdz/lSrX32LV
         VAKIOkuKSTTARDamCkyk6ONI+FQ/ScXFtq09WxLlKF5pYLIGyGjiSo0IImrR+DVfH/zB
         9Z8Y+9brGBm6YBVderNVEhUTrsP9AL0UIZinedH5n2zGOMHjYrrColM/hx2IVc0aIc55
         iwhDuMLwTthyCJtaYliJbSVB7JrFmdp8F/MaNGtporewGOSVKqt+cSHJeYZ0c8HDlC0T
         JdNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691813927; x=1692418727;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vatK4Ipf//SB8sITykjtNfrRvHRtapdBa/MAooU+rFs=;
        b=I5thJ4Qzi/bHg0ZdhmRrk0uIXBM9XzUeIQXat6hIHIBoGaGcy4kLnVYyZap4q1vyv8
         tjaEqd2ShH/9AxhWACil6oCZNDD10KCiz8n3s86P5g8qh8OP9TlSrCpCDOLcC2Vi9US3
         MGBkxaiFy6QnIWBdufWHnX9+3PQomspFjnk9+dpWuUliyVRoBgPA8d5YBMX6pLWUXGWT
         M+A0qne/zskq+QBAFo1P5nK8ry0SxpGRouTh63So+lxpMTPbDUNGQ5WZIpA+xJjoju6A
         ci4qyFG58pV+mhlMV9hVQFA9jW7cFGVa7hXPGsDAGjOcta1sBjDhZKZAgOvSQNfe2CR4
         EHSA==
X-Gm-Message-State: AOJu0YxR7MtBZe//u2/RGfIfR4V+mABkc6pLIwrNkAE+sTu+vkfriVXD
	QfgMNHf99aLsJSr2x88yXM8gHubCLKicE2Wk/pQ=
X-Google-Smtp-Source: AGHT+IEc18G3uG+/weXp8mjLxwHF+vtCpe3fvBum6u1VrznFjc1fgjOZqzeY9isTcDlOEeUvff2d4BsxH1d9F1EfEdc=
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a17:907:2ce9:b0:992:a9c3:244f with SMTP id
 hz9-20020a1709072ce900b00992a9c3244fmr3418972ejc.4.1691813926882; Fri, 11 Aug
 2023 21:18:46 -0700 (PDT)
Received: from 170827741999 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 11 Aug 2023 21:18:46 -0700
In-Reply-To: <CAC5d1WLA9UYH6=zxyz9hRNuX2Z4ZZGS=D9LNn+jkbyRc1RrtoA@mail.gmail.com>
References: <CAC5d1WLA9UYH6=zxyz9hRNuX2Z4ZZGS=D9LNn+jkbyRc1RrtoA@mail.gmail.com>
From: harrynicomama@gmail.com
Date: Fri, 11 Aug 2023 21:18:46 -0700
Message-ID: <CAC5d1WL-f1VJRG8GP1iTD+6=77dCABTLccNGN7mocrMfPsLpZQ@mail.gmail.com>
Subject: Quick Reply Extension Testing
To: harrynicomama@gmail.com
Cc: extensiontest66@gmail.com, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> > Browser extension test thread for quick email replies.
> >
> > Please Ignore.
>
> Testing quoting and email system.

Testing quote structure and in-reply-to ids.
