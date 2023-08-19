Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85316134B2
	for <imx@lists.linux.dev>; Sat, 19 Aug 2023 17:29:23 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-522bd411679so2384589a12.0
        for <imx@lists.linux.dev>; Sat, 19 Aug 2023 10:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692466161; x=1693070961;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YAScUFy6HqVi4iD0Ivq2tmyn3A60Wl/CgO6WRyP5N2o=;
        b=fze6AsbIRwcjCWUJnD1ibTKChp+G2mZDywEEkWqne2M12QeZn9FRtCVpiUK3Gx8bjG
         +WwviskPU6F+2ToXIDgwQYVCQK049GeiKc0RvQlO8NA0a9A3k6eJ24Sz6XOFHYEqtI1q
         /vF12JbmS0P2/10VcqW9cjd1lw6kdp/czIv4wezi3V0JNWqEPujGOintESU0h72rOhqz
         ECA+dij5W3OYrm3FumOL10f4BU0y5abJwTzADz6OPuJJlzK2+kzVhQlFsmf3NGwU1aql
         P0oSpFQqMErjlE2tU0Z01VkZVv/xfU34mmZ4iccWfoMHfgXEmaAXV3+sXpG/3sVj35J4
         yp2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692466161; x=1693070961;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YAScUFy6HqVi4iD0Ivq2tmyn3A60Wl/CgO6WRyP5N2o=;
        b=X78YNZtgtofHum3HwuB+jKa6ABRbpHYucG2o+6Tmf6k+OYDDs8l2TP1y/ikIyNWbpT
         Zu96idmFtZvgZAAXco8/37YP2Q/JmzDSG84sFSMO3apIj0ms1W9U71qHqCiOJmhvUv6D
         L54wsVOqaiH3jR6V7OfT+QW/VjUOQM7NdUnKW8NLQx0gSsByW54y7y66pjNgrwfbk1ls
         BntdR24Kw9PswZw1tl5PDtLMx+02ukdvffXg0ovrSkTxIURLRpZ3RL2OIEiilWW+Ai3u
         WlxGbuScV/88K0solhweR69dtGJqK0eb51ZIZc09Dz3/iXr7oL+nl4pvuZh44dh20VHo
         8gGw==
X-Gm-Message-State: AOJu0YyCm6sie14lhnhVvAOuHpsD9xGxZpneDk8Zyn0TCbA7eN3h2WO3
	h8bijlfrFcM2PH4sxD6I29m/OJjFKWRi1/FGeQ0=
X-Google-Smtp-Source: AGHT+IHsvXHTLkXTCxKdSpwHz6SDobipvblIbCGrxHCt21Z3X3fdWDzSVF8SBPRjkIT3GI0TxAjQBeWxNt+p+DiAcAk=
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:aa7:cd50:0:b0:523:102f:3ce1 with SMTP id
 v16-20020aa7cd50000000b00523102f3ce1mr1780581edw.10.1692466161316; Sat, 19
 Aug 2023 10:29:21 -0700 (PDT)
Received: from 170827741999 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 19 Aug 2023 10:29:20 -0700
From: Qi Wang <harrynicomama@gmail.com>
In-Reply-To: <CAC5d1W+oAF1Vjipo1TZC8RavxjoLvo3G60Um5N6Qb9ZrODSbvw@mail.gmail.com>
References: <CAC5d1W+oAF1Vjipo1TZC8RavxjoLvo3G60Um5N6Qb9ZrODSbvw@mail.gmail.com>
Date: Sat, 19 Aug 2023 10:29:20 -0700
Message-ID: <CAC5d1WLHgC4A9U0CY000DfUqaY1an_RTPTLKFGVLaCQ+WMJQtw@mail.gmail.com>
Subject: RE: [EXT] Quick Reply Extension Testing
To: harrynicomama@gmail.com
Cc: extensiontest66@gmail.com, imx@lists.linux.dev, shenwei.wang@nxp.com
Content-Type: text/plain; charset="UTF-8"

testing api

type response here.

==============================
Replied with love by Quick Reply Extension
https://github.com/HarryWangATX/quick-reply-extension
